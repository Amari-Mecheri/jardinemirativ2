import 'package:flutter/material.dart';
import 'package:jardinemirativ2/screens/admin_tabs/marques_tab.dart';

import 'admin_tabs/categories_tab.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'Marques'),
    Tab(text: 'Catégories'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: const TabBarView(
          children: [
            MarqueTab(),
            CategorieTab(),
          ],
        ),
      ),
    );
  }
}
