import 'package:cloud_firestore/cloud_firestore.dart';

class OrderLine {
  final String basketId;
  final String productId;
  final int quantity;
  final double unitPrice;

  const OrderLine({
    required this.basketId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  });

  Map<String, dynamic> toJson() => {
        'basketId': basketId,
        'productId': productId,
        'quantity': quantity,
        'unitPrice': unitPrice,
      };

  static OrderLine fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return OrderLine(
      basketId: snapshot['basketId'],
      productId: snapshot['productId'],
      quantity: snapshot['quantity'],
      unitPrice: snapshot['unitPrice'],
    );
  }
}
