// ignore_for_file: unused_field

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:jardinemirativ2/models/categorie.dart';
import 'package:uuid/uuid.dart';

import '../models/marque.dart';
import 'storage_methods.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
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

        _firestore.collection('marques').doc(marqueId).set(
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

        _firestore.collection('categories').doc(categorieId).set(
              categorie.toJson(),
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
