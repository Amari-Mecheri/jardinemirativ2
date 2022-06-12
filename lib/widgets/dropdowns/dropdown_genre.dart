import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/consts/global_variables.dart';

import '../../classes/global_static.dart';
import '../../consts/colors.dart';

class DropDownGenres extends StatelessWidget {
  final List<String> items;
  final Function onChanged;

  const DropDownGenres({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      buttonWidth: 170,
      buttonHeight: 28,
      hint: const Text('Tout genre'),
      value: GlobalStatic.searchScreenGenre,
      buttonPadding: const EdgeInsets.only(left: 8, right: 4),
      buttonDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color.fromARGB(255, 243, 234, 224),
      ),
      buttonElevation: 2,
      //icon: const Icon(Icons.arrow_downward),
      //elevation: 16,
      style: const TextStyle(
          color: webInActiveMenuBar, fontWeight: FontWeight.bold),

      underline: Container(),
      onChanged: (String? newValue) {
        //GlobalStatic.searchScreenGenre = newValue!;
        onChanged(newValue!.genderFromString());
      },
      items: items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: value.isEmpty || value.toUpperCase() == "TOUS"
              ? const Text('Tout genre')
              : Text(value),
        );
      }).toList(),
    );
  }
}
