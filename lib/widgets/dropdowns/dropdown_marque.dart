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
    return DropdownButton<String>(
      value: GlobalStatic.searchScreenMarque.marqueId,
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
          value: value.marqueId,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
