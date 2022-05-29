import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String productId;
  final String title;
  final String description;
  final double price;
  final String photoUrl;
  final String marqueId;
  final String genre;
  final String categorieId;
  final List likes;

  const Product({
    required this.name,
    required this.productId,
    required this.title,
    required this.description,
    required this.price,
    required this.photoUrl,
    required this.marqueId,
    required this.genre,
    required this.categorieId,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'productId': productId,
        'title': title,
        'description': description,
        'price': price,
        'photoUrl': photoUrl,
        'marqueId': marqueId,
        'genre': genre,
        'categorieId': categorieId,
        'likes': likes,
      };

  static Product fromSnap(DocumentSnapshot snap) {
    if (snap.data() != null) {
      var snapshot = snap.data() as Map<String, dynamic>;
      return Product(
        name: snapshot['name'],
        productId: snapshot['productId'],
        title: snapshot['title'],
        description: snapshot['description'],
        price: snapshot['price'],
        photoUrl: snapshot['photoUrl'],
        marqueId: snapshot['marqueId'],
        genre: snapshot['genre'],
        categorieId: snapshot['categorieId'],
        likes: snapshot['likes'],
      );
    }
    return const Product(
      name: 'name',
      productId: 'productId',
      title: 'title',
      description: 'description',
      price: 0.0,
      photoUrl: 'photoUrl',
      marqueId: '',
      genre: '',
      categorieId: '',
      likes: [],
    );
  }
}
