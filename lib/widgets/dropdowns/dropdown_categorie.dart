import 'package:flutter/material.dart';

import '../../classes/global_static.dart';
import '../../consts/colors.dart';
import '../../models/categorie.dart';

class DropDownCategories extends StatelessWidget {
  final List<Categorie> items;
  final Function onChanged;

  const DropDownCategories({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: GlobalStatic.searchScreenCategorie.categorieId,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: webInActiveMenuBar),
      underline: Container(
        height: 2,
        color: webActiveMenuBar,
      ),
      onChanged: (String? newValue) {
        //GlobalStatic.searchScreenGenre = newValue!;
        onChanged(newValue);
      },
      items: items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.categorieId,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
