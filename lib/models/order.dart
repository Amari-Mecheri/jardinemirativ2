import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String orderId;
  final String userId;
  final String status;
  final String deliveryAddress;
  final DateTime date;
  final double total;
  final double vat;

  const Order({
    required this.orderId,
    required this.userId,
    required this.status,
    required this.deliveryAddress,
    required this.date,
    required this.total,
    required this.vat,
  });

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'userId': userId,
        'status': status,
        'deliveryAddress': deliveryAddress,
        'date': date,
        'total': total,
        'vat': vat,
      };

  static Order fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Order(
      orderId: snapshot['orderId'],
      userId: snapshot['userId'],
      status: snapshot['status'],
      deliveryAddress: snapshot['deliveryAddress'],
      date: snapshot['date'].toDate(),
      // date: DateTime.fromMillisecondsSinceEpoch(
      //    int.parse(snapshot['date'].toString())),
      total: snapshot['total'],
      vat: snapshot['vat'],
    );
  }
}
