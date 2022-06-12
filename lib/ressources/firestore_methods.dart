// ignore_for_file: unused_field

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:jardinemirativ2/models/categorie.dart';
import 'package:uuid/uuid.dart';

import '../models/marque.dart';
import '../models/order.dart';
import '../models/order_line.dart';
import '../models/product.dart';
import 'storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload Marque
  Future<String> uploadMarque(
    String marqueId,
    String name,
    String description,
    Uint8List image,
  ) async {
    String res = "Le nom de la marque est requis";
    try {
      if (name.isNotEmpty) {
        String photoUrl = await StorageMethods().uploadImageToStorage(
          'images',
          image,
        );

        if (marqueId.isEmpty) marqueId = const Uuid().v1();

        Marque marque = Marque(
          description: description,
          marqueId: marqueId,
          name: name,
          photoUrl: photoUrl,
        );

        await _firestore.collection('marques').doc(marqueId).set(
              marque.toJson(),
            );
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadCategorie(
    String categorieId,
    String name,
    String description,
    Uint8List image,
  ) async {
    String res = "Le nom de la catégorie est requis";
    try {
      if (name.isNotEmpty) {
        String photoUrl = await StorageMethods().uploadImageToStorage(
          'images',
          image,
        );

        if (categorieId.isEmpty) categorieId = const Uuid().v1();

        Categorie categorie = Categorie(
          description: description,
          categorieId: categorieId,
          name: name,
          photoUrl: photoUrl,
        );

        await _firestore.collection('categories').doc(categorieId).set(
              categorie.toJson(),
            );
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadProduct(
    final String name,
    String productId,
    final String title,
    final String description,
    final double price,
    final String marqueId,
    final String genre,
    final String categorieId,
    final List likes,
    final Uint8List image,
  ) async {
    String res = "Le nom de l'article est requis";
    try {
      if (name.isNotEmpty) {
        String photoUrl = await StorageMethods().uploadImageToStorage(
          'images',
          image,
        );

        if (productId.isEmpty) productId = const Uuid().v1();

        Product product = Product(
          name: name,
          productId: productId,
          title: title,
          description: description,
          price: price,
          photoUrl: photoUrl,
          marqueId: marqueId,
          genre: genre,
          categorieId: categorieId,
          likes: likes,
        );

        await _firestore.collection('articles').doc(productId).set(
              product.toJson(),
            );
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> uploadOrder(
    final String userId,
    String orderId,
    final String status,
    final String deliveryAddress,
    final DateTime date,
    final double total,
    final double vat,
  ) async {
    String res = "L'ID utilisateur est requis";
    try {
      if (userId.isNotEmpty) {
        if (orderId.isEmpty) orderId = const Uuid().v1();

        Order order = Order(
          userId: userId,
          orderId: orderId,
          status: status,
          deliveryAddress: deliveryAddress,
          date: date,
          total: total,
          vat: vat,
        );

        await _firestore
            .collection('users')
            .doc(userId)
            .collection('orders')
            .doc(orderId)
            .set(
              order.toJson(),
            );
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Future<void> likePost(String postId, String uid, List likes) async {
  //   try {
  //     if (likes.contains(uid)) {
  //       await _firestore.collection('posts').doc(postId).update({
  //         'likes': FieldValue.arrayRemove([uid]),
  //       });
  //     } else {
  //       await _firestore.collection('posts').doc(postId).update({
  //         'likes': FieldValue.arrayUnion([uid]),
  //       });
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  // }

  Future<String> addToBasket(
    String orderLineId,
    String basketId,
    String productId,
    int quantity,
    double unitPrice,
  ) async {
    String res =
        "Le panier, le produit, la quantité et le prix unitaire sont requis";
    try {
      if (basketId.isNotEmpty &&
          productId.isNotEmpty &&
          quantity > 0 &&
          unitPrice > 0) {
        if (orderLineId.isEmpty) orderLineId = const Uuid().v1();

        OrderLine orderLine = OrderLine(
          orderLineId: orderLineId,
          basketId: basketId,
          productId: productId,
          quantity: quantity,
          unitPrice: unitPrice,
        );

        await _firestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('orders')
            .doc(basketId)
            .collection('orderLines')
            .doc(orderLineId)
            .set(
              orderLine.toJson(),
            );
        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> deleteMarque(String marqueId) async {
    try {
      await _firestore.collection('marques').doc(marqueId).delete();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  // Future<void> postComment(String postId, String text, String uid, String name,
  //     String profilePic) async {
  //   try {
  //     if (text.isNotEmpty) {
  //       String commentId = const Uuid().v1();

  //       Comment comment = Comment(
  //         profilePic: profilePic,
  //         name: name,
  //         marqueId: uid,
  //         text: text,
  //         commentId: commentId,
  //         datePublished: DateTime.now(),
  //         likes: [],
  //       );

  //       await _firestore
  //           .collection('posts')
  //           .doc(postId)
  //           .collection('comments')
  //           .doc(commentId)
  //           .set(comment.toJson());
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  // }

  // Future<void> likeComment(
  //     String postId, String commentId, String uid, List likes) async {
  //   try {
  //     if (likes.contains(uid)) {
  //       await _firestore
  //           .collection('posts')
  //           .doc(postId)
  //           .collection('comments')
  //           .doc(commentId)
  //           .update({
  //         'likes': FieldValue.arrayRemove([uid]),
  //       });
  //     } else {
  //       await _firestore
  //           .collection('posts')
  //           .doc(postId)
  //           .collection('comments')
  //           .doc(commentId)
  //           .update({
  //         'likes': FieldValue.arrayUnion([uid]),
  //       });
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  // }

  Future<void> followUser(
    String uid,
    String followId,
  ) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];
      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });
        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
