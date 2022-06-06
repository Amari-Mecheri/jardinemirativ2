import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';
import 'package:jardinemirativ2/models/order_line.dart';
import '../../models/order.dart';
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
      print("creating basket");
      FirestoreMethods().uploadOrder(FirebaseAuth.instance.currentUser!.uid, '',
          OrderStatus.ouvert.name, '', DateTime.now(), 0, 0);
    } else {
      QuerySnapshot<Map<String, dynamic>> lines = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('orders')
          .doc(basket!.orderId)
          .collection('orderLines')
          .get();

      var data = lines.docs;
      basketLines.clear();
      for (var line in data) {
        var p = OrderLine.fromSnap(line);
        basketLines.add(p);
      }
    }
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
