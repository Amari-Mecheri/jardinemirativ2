import 'package:cloud_firestore/cloud_firestore.dart';

class Marque {
  final String description;
  final String marqueId;
  final String name;
  final String photoUrl;

  const Marque({
    required this.description,
    required this.marqueId,
    required this.name,
    required this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'description': description,
        'marqueId': marqueId,
        'name': name,
        'photoUrl': photoUrl,
      };

  static Marque fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Marque(
      description: snapshot['description'],
      marqueId: snapshot['marqueId'],
      name: snapshot['name'],
      photoUrl: snapshot['photoUrl'],
    );
  }
}
