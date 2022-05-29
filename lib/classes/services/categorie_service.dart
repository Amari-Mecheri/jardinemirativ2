import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/categorie.dart';

class Categories {
  static final Categories _instance = Categories._internal();

  factory Categories() {
    return _instance;
  }

  Categories._internal() {
    initCategories();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> categories =
      FirebaseFirestore.instance.collection('categories').snapshots();
  dynamic initCategories() {
    categories.listen((event) {
      loadCategories(event.docs);
    });
    return null;
  }

  List<Categorie> listCategories = [];

  loadCategories(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    listCategories.clear();
    for (var element in docs) {
      var c = Categorie.fromSnap(element);
      listCategories.add(c);
    }
  }
}

extension SearchTools on Categories {
  List<String> distinctValues(String column) {
    return listCategories
        .map((element) => element.toJson()[column].toString())
        .toSet()
        .toList();
  }

  static bool _equality(String a, String b) {
    return a == b;
  }

  List<Categorie> distinct(String column, String value,
      {bool Function(String a, String b) compareFunction = _equality}) {
    return listCategories
        .where((element) =>
            compareFunction(element.toJson()[column].toString(), value))
        .toList();
  }

  Categorie fromId(String id) {
    return listCategories.firstWhere((element) => element.categorieId == id);
  }

  List<Categorie> fromListIds(List<String> ids) {
    return listCategories
        .where((element) => ids.contains(element.categorieId))
        .toList();
  }
}
