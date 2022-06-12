import 'package:dropdown_button2/dropdown_button2.dart';
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
    return DropdownButton2<String>(
      buttonWidth: 180,
      buttonHeight: 28,
      value: GlobalStatic.searchScreenCategorie.categorieId,
      // icon: const Icon(Icons.arrow_downward),
      // elevation: 16,
      buttonPadding: const EdgeInsets.only(left: 8, right: 4),
      buttonDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(255, 243, 234, 224),
      ),
      buttonElevation: 2,
      style: const TextStyle(
          color: webInActiveMenuBar, fontWeight: FontWeight.bold),
      underline: Container(),
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
