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
    return DropdownButton<String>(
      hint: const Text('Tout genre'),
      value: GlobalStatic.searchScreenGenre,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: webInActiveMenuBar),
      underline: Container(
        height: 2,
        color: webActiveMenuBar,
      ),
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
