// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import '../../models/product.dart';

// class ProductDataSource extends DataGridSource {
//   ProductDataSource({required List<Product> products}) {
//     dataGridRows = products
//         .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
//               DataGridCell<String>(
//                   columnName: 'photo', value: dataGridRow.photoUrl),
//               DataGridCell<String>(
//                   columnName: 'productId', value: dataGridRow.productId),
//               DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
//               DataGridCell<String>(
//                   columnName: 'title', value: dataGridRow.title),
//               DataGridCell<String>(
//                   columnName: 'description', value: dataGridRow.description),
//               DataGridCell<double>(
//                   columnName: 'price', value: dataGridRow.price),
//             ]))
//         .toList();
//     // print(products.length);
//     // print(dataGridRows.length);
//   }

//   List<DataGridRow> dataGridRows = [];

//   @override
//   List<DataGridRow> get rows => dataGridRows;

//   @override
//   DataGridRowAdapter? buildRow(DataGridRow row) {
//     //print(row.getCells().toList().map((e) => e.columnName).toList());
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((dataGridCell) {
//       return Container(
//           alignment: (dataGridCell.columnName == 'id' ||
//                   dataGridCell.columnName == 'price')
//               ? Alignment.centerRight
//               : Alignment.centerLeft,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: dataGridCell.columnName == 'photo'
//               ? Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(),
//                     image: DecorationImage(
//                       image: NetworkImage(dataGridCell.value),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 )
//               : Text(
//                   dataGridCell.value.toString(),
//                   overflow: TextOverflow.ellipsis,
//                 ));
//     }).toList());
//   }
// }
