import 'package:pluto_grid/pluto_grid.dart';

import '../../classes/global_static.dart';
import '../../classes/services/categorie_service.dart';
import '../../classes/services/marque_service.dart';
import '../../classes/services/product_service.dart';

class ProductGridData {
  static final ProductGridData _instance = ProductGridData._internal();

  factory ProductGridData() {
    return _instance;
  }

  ProductGridData._internal() {
    Products().products.listen((event) {
      loadProductGridData();
    });
    loadProductGridData();
  }

  late List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Id',
      field: 'productId',
      type: PlutoColumnType.text(),
      hide: true,
    ),
    PlutoColumn(
      title: 'Nom',
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Titre',
      field: 'title',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Description',
      field: 'description',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Prix',
      field: 'price',
      textAlign: PlutoColumnTextAlign.right,
      type: PlutoColumnType.number(
        format: '#,###.##',
      ),
    ),
    PlutoColumn(
      title: 'Marque',
      field: 'marque',
      type: PlutoColumnType.select(
          ['', ...Marques().listMarques.map((e) => e.name).toList()]),
    ),
    PlutoColumn(
      title: 'Catégorie',
      field: 'categorie',
      type: PlutoColumnType.select(
          ['', ...Categories().listCategories.map((e) => e.name)]),
    ),
    PlutoColumn(
      title: 'Genre',
      field: 'genre',
      type: PlutoColumnType.select(GlobalStatic.genres),
    ),
    PlutoColumn(
      enableEditingMode: false,
      textAlign: PlutoColumnTextAlign.right,
      title: 'Likes',
      field: 'likes',
      type: PlutoColumnType.number(),
    ),
  ];
  late List<PlutoRow> rows = [];

  List<PlutoRow> getRows() {
    return Products()
        .listProducts
        .map(
          (p) => PlutoRow(
            cells: {
              'productId': PlutoCell(value: p.productId),
              'name': PlutoCell(value: p.name),
              'title': PlutoCell(value: p.title),
              'description': PlutoCell(value: p.description),
              'price': PlutoCell(value: p.price),
              'marque': PlutoCell(
                value: p.marqueId.isNotEmpty
                    ? Marques().distinct('marqueId', p.marqueId).first.name
                    : '',
              ),
              'categorie': PlutoCell(
                value: p.categorieId.isNotEmpty
                    ? Categories()
                        .distinct('categorieId', p.categorieId)
                        .first
                        .name
                    : '',
              ),
              'genre': PlutoCell(value: p.genre),
              'likes': PlutoCell(value: p.likes.length),
            },
          ),
        )
        .toList();
  }

  loadProductGridData() {
    //columns.clear();
    rows.clear();
    if (Products().listProducts.isNotEmpty) {
      for (var element in Products().listProducts) {
        var p = element;
        //     for (var element in docs) {
        // var p = Product.fromSnap(element);
        rows.add(
          PlutoRow(
            cells: {
              'nom': PlutoCell(value: p.name),
              'title': PlutoCell(value: p.title),
              'description': PlutoCell(value: p.description),
              // 'price': PlutoCell(value: p.price),
              // 'marque': PlutoCell(
              //   value: Marques().distinct('marqueId', p.marqueId).first.name,
              // ),
              // 'categorie': PlutoCell(
              //   value: Categories()
              //       .distinct('categorieId', p.categorieId)
              //       .first
              //       .name,
              // ),
              // 'genre': PlutoCell(value: p.genre),
              // 'likes': PlutoCell(value: p.likes.length),
            },
          ),
        );
      }
    }
  }

  // ProductGridData() {
  //   columns = [
  //     PlutoColumn(
  //       title: 'Text',
  //       field: 'text_field',
  //       type: PlutoColumnType.text(),
  //     ),
  //     PlutoColumn(
  //       title: 'Number',
  //       field: 'number_field',
  //       type: PlutoColumnType.number(),
  //     ),
  //     PlutoColumn(
  //       title: 'Select',
  //       field: 'select_field',
  //       type: PlutoColumnType.select(['item1', 'item2', 'item3']),
  //     ),
  //     PlutoColumn(
  //       title: 'Date',
  //       field: 'date_field',
  //       type: PlutoColumnType.date(),
  //     ),
  //   ];

  //   rows = [
  //     PlutoRow(
  //       cells: {
  //         'text_field': PlutoCell(value: 'Text cell value1'),
  //         'number_field': PlutoCell(value: 2020),
  //         'select_field': PlutoCell(value: 'item1'),
  //         'date_field': PlutoCell(value: '2020-08-06'),
  //       },
  //     ),
  //     PlutoRow(
  //       cells: {
  //         'text_field': PlutoCell(value: 'Text cell value2'),
  //         'number_field': PlutoCell(value: 2021),
  //         'select_field': PlutoCell(value: 'item2'),
  //         'date_field': PlutoCell(value: '2020-08-07'),
  //       },
  //     ),
  //     PlutoRow(
  //       cells: {
  //         'text_field': PlutoCell(value: 'Text cell value3'),
  //         'number_field': PlutoCell(value: 2022),
  //         'select_field': PlutoCell(value: 'item3'),
  //         'date_field': PlutoCell(value: '2020-08-08'),
  //       },
  //     ),
  //   ];
  // }
}
