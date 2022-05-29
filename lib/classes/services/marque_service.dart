import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/marque.dart';

class Marques {
  static final Marques _instance = Marques._internal();

  factory Marques() {
    return _instance;
  }

  Marques._internal() {
    initMarques();
  }
  Stream<QuerySnapshot<Map<String, dynamic>>> marques =
      FirebaseFirestore.instance.collection('marques').snapshots();
  dynamic initMarques() {
    marques.listen((event) {
      loadMarques(event.docs);
    });
    return null;
  }

  List<Marque> listMarques = [];

  loadMarques(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    listMarques.clear();
    for (var element in docs) {
      var m = Marque.fromSnap(element);
      listMarques.add(m);
    }
  }
}

extension SearchTools on Marques {
  List<String> distinctValues(String column) {
    return listMarques
        .map((element) => element.toJson()[column].toString())
        .toSet()
        .toList();
  }

  static bool _equality(String a, String b) {
    return a == b;
  }

  List<Marque> distinct(String column, String value,
      {bool Function(String a, String b) compareFunction = _equality}) {
    return listMarques
        .where((element) =>
            compareFunction(element.toJson()[column].toString(), value))
        .toList();
  }
}
