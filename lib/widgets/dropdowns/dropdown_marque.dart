import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../classes/global_static.dart';
import '../../consts/colors.dart';
import '../../models/marque.dart';

class DropDownMarques extends StatelessWidget {
  final List<Marque> items;
  final Function onChanged;

  const DropDownMarques({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      buttonWidth: 170,
      buttonHeight: 28,
      value: GlobalStatic.searchScreenMarque.marqueId,
      buttonPadding: const EdgeInsets.only(left: 8, right: 4),
      buttonDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(255, 243, 234, 224),
      ),
      buttonElevation: 2,
      //borderRadius: BorderRadius.circular(14),
      style: const TextStyle(
          color: webInActiveMenuBar, fontWeight: FontWeight.bold),
      underline: Container(),
      onChanged: (String? newValue) {
        //GlobalStatic.searchScreenGenre = newValue!;
        onChanged(newValue);
      },
      items: items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value.marqueId,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
