import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/product.dart';

class Products {
  static final Products _instance = Products._internal();

  factory Products() {
    return _instance;
  }

  Products._internal() {
    initProducts();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> products =
      FirebaseFirestore.instance.collection('articles').snapshots();
  dynamic initProducts() {
    products.listen((event) {
      loadProducts(event.docs);
    });
    return null;
  }

  List<Product> listProducts = [];

  loadProducts(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    listProducts.clear();
    for (var element in docs) {
      var p = Product.fromSnap(element);
      listProducts.add(p);
    }
  }
}

extension SearchTools on Products {
  List<String> distinctValues(String column) {
    return listProducts
        .map((element) => element.toJson()[column].toString())
        .toSet()
        .toList();
  }

  static bool _equality(String a, String b) {
    return a == b;
  }

  List<Product> distinct(String column, String value,
      {bool Function(String a, String b) compareFunction = _equality}) {
    return listProducts
        .where((element) => compareFunction(
            element.toJson()[column].toString().toUpperCase(),
            value.toUpperCase()))
        .toList();
  }
}

extension SearchProducts on List<Product> {
  List<String> distinctValues(String column) {
    return map((element) => element.toJson()[column].toString())
        .toSet()
        .toList();
  }

  static bool _equality(String a, String b) {
    return a == b;
  }

  List<Product> distinct(String column, String value,
      {bool Function(String a, String b) compareFunction = _equality}) {
    return where((element) =>
        compareFunction(element.toJson()[column].toString(), value)).toList();
  }
}
