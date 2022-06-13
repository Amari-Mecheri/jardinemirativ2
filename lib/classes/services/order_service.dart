import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';
import 'package:jardinemirativ2/models/order_line.dart';
import '../../models/order.dart';
import '../../models/product.dart';
import '../../ressources/firestore_methods.dart';

class Orders {
  static final Orders _instance = Orders._internal();

  factory Orders() {
    return _instance;
  }

  Orders._internal() {
    initOrders();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> orders = FirebaseFirestore
      .instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('orders')
      .snapshots();
  dynamic initOrders() {
    return orders.listen((event) async {
      await loadOrders(event.docs);
    });
  }

  List<Order>? listOrders;
  Order? basket;
  Stream<QuerySnapshot<Map<String, dynamic>>>? basketLinesStream;
  List<OrderLine> basketLines = [];

  loadOrders(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) async {
    if (listOrders != null) {
      listOrders!.clear();
    } else {
      listOrders = [];
    }
    basket = null;
    for (var element in docs) {
      var p = Order.fromSnap(element);
      listOrders!.add(p);
      if (p.status.orderStatusFromString() == OrderStatus.ouvert) {
        basket = p;
      }
    }
    if (basket == null) {
      await FirestoreMethods().uploadOrder(
        FirebaseAuth.instance.currentUser!.uid,
        '',
        OrderStatus.ouvert.name,
        '',
        DateTime.now(),
        0,
        0,
      );
    } else {
      basketLinesStream = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('orders')
          .doc(basket!.orderId)
          .collection('orderLines')
          .snapshots();

      basketLinesStream?.listen((event) {
        basketLines.clear();
        for (var element in event.docs) {
          var ol = OrderLine.fromSnap(element);
          basketLines.add(ol);
        }
      });
      // QuerySnapshot<Map<String, dynamic>> lines = await FirebaseFirestore
      //     .instance
      //     .collection('users')
      //     .doc(FirebaseAuth.instance.currentUser!.uid)
      //     .collection('orders')
      //     .doc(basket!.orderId)
      //     .collection('orderLines')
      //     .get();

      // var data = lines.docs.;
      // basketLines.clear();
      // for (var line in data) {
      //   var p = OrderLine.fromSnap(line);
      //   basketLines.add(p);
      // }
    }
  }
}

extension BasketTools on Orders {
  Future<String> addToBasket(Product product) async {
    var qty = 1;
    var productLine = Orders()
        .basketLines
        .where((element) => element.productId == product.productId);
    if (productLine.isNotEmpty) {
      qty = productLine.first.quantity + 1;
      return await FirestoreMethods().addToBasket(productLine.first.orderLineId,
          basket!.orderId, product.productId, qty, product.price);
    }
    return await FirestoreMethods().addToBasket(
        '', basket!.orderId, product.productId, qty, product.price);
  }

  Future<String> subFromBasket(Product product) async {
    var qty = 0;
    var productLine = Orders()
        .basketLines
        .where((element) => element.productId == product.productId);
    if (productLine.isNotEmpty) {
      qty = productLine.first.quantity - 1;
      if (qty > 0) {
        return await FirestoreMethods().addToBasket(
            productLine.first.orderLineId,
            basket!.orderId,
            product.productId,
            qty,
            product.price);
      } else {
        removeFromBasket(product);
      }
    }
    return await FirestoreMethods().addToBasket(
        '', basket!.orderId, product.productId, qty, product.price);
  }

  Future<String> removeFromBasket(Product product) async {
    var productLine = Orders()
        .basketLines
        .where((element) => element.productId == product.productId);
    if (productLine.isNotEmpty) {
      return await FirestoreMethods()
          .removeFromBasket(productLine.first.orderLineId, basket!.orderId);
    }
    return "Ce produit n'est pas dans le panier";
  }
}

extension SearchTools on Orders {
  List<String> distinctValues(String column) {
    return listOrders != null
        ? listOrders!
            .map((element) => element.toJson()[column].toString())
            .toSet()
            .toList()
        : [];
  }

  static bool _equality(String a, String b) {
    return a == b;
  }

  List<Order> distinct(String column, String value,
      {bool Function(String a, String b) compareFunction = _equality}) {
    return listOrders != null
        ? listOrders!
            .where((element) => compareFunction(
                element.toJson()[column].toString().toUpperCase(),
                value.toUpperCase()))
            .toList()
        : [];
  }
}

extension SearchOrders on List<Order> {
  List<String> distinctValues(String column) {
    return map((element) => element.toJson()[column].toString())
        .toSet()
        .toList();
  }

  static bool _equality(String a, String b) {
    return a == b;
  }

  List<Order> distinct(String column, String value,
      {bool Function(String a, String b) compareFunction = _equality}) {
    return where((element) =>
        compareFunction(element.toJson()[column].toString(), value)).toList();
  }

  Order fromId(String id) {
    return firstWhere((element) => element.orderId == id);
  }

  List<Order> fromListIds(List<String> ids) {
    return where((element) => ids.contains(element.orderId)).toList();
  }
}
