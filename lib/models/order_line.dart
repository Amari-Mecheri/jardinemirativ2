import 'package:cloud_firestore/cloud_firestore.dart';

class OrderLine {
  final String orderLineId;
  final String basketId;
  final String productId;
  final int quantity;
  final double unitPrice;

  const OrderLine({
    required this.orderLineId,
    required this.basketId,
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  });

  Map<String, dynamic> toJson() => {
        'orderLineId': orderLineId,
        'basketId': basketId,
        'productId': productId,
        'quantity': quantity,
        'unitPrice': unitPrice,
      };

  static OrderLine fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    // print(snapshot['orderLineId']);
    // print(snapshot['basketId']);
    // print(snapshot['productId']);
    // print(snapshot['quantity']);
    // print(snapshot['unitPrice']);
    return OrderLine(
      orderLineId: snapshot['orderLineId'],
      basketId: snapshot['basketId'],
      productId: snapshot['productId'],
      quantity: snapshot['quantity'],
      unitPrice: snapshot['unitPrice'],
    );
  }
}
