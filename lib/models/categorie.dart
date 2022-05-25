import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie {
  final String description;
  final String categorieId;
  final String name;
  final String photoUrl;

  const Categorie({
    required this.description,
    required this.categorieId,
    required this.name,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'description': description,
        'categorieId': categorieId,
        'name': name,
        'photoUrl': photoUrl,
      };

  static Categorie fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Categorie(
      description: snapshot['description'],
      categorieId: snapshot['categorieId'],
      name: snapshot['name'],
      photoUrl: snapshot['photoUrl'],
    );
  }
}
