import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jardinemirativ2/classes/global_static.dart';
import 'package:jardinemirativ2/widgets/basket.dart';

import '../../classes/main_page_controller.dart';
import '../../classes/services/order_service.dart';
import '../../consts/colors.dart';

class WebMenuBar extends StatefulWidget implements PreferredSizeWidget {
  const WebMenuBar({Key? key}) : super(key: key);

  @override
  State<WebMenuBar> createState() => _WebMenuBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _WebMenuBarState extends State<WebMenuBar> {
  //int _page = 0;

  // void onPageChanged(int page) {
  //   // setState(() {
  //   //   _page = page;
  //   // });
  //   GlobalStatic.mainPage.value = page;
  // }

  @override
  Widget build(BuildContext context) {
    //MainPageController.addOnPageChangedCallback(onPageChanged);

    return ValueListenableBuilder(
        valueListenable: GlobalStatic.mainPage,
        builder: (context, page, child) {
          return AppBar(
            //toolbarHeight: 40,
            backgroundColor: Colors.white.withOpacity(0.8),
            //toolbarOpacity: 0.2,
            centerTitle: false,
            title: Wrap(
              direction: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 96,
                ),
                InkWell(
                  onTap: () => MainPageController.navigationTab(0),
                  child: Image.asset(
                    'logo.png',
                    //color: Colors.orangeAccent,
                    height: 40,
                  ),
                ),
              ],
            ),
            actions: [
              Wrap(
                direction: Axis.horizontal,
                children: [
                  TextButton(
                    onPressed: () => MainPageController.navigationTab(0),
                    child: Text(
                      "Accueil",
                      style: TextStyle(
                          color:
                              page == 0 ? webActiveMenuBar : webInActiveMenuBar,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => MainPageController.navigationTab(1),
                    child: Text(
                      "Admin",
                      style: TextStyle(
                          color:
                              page == 1 ? webActiveMenuBar : webInActiveMenuBar,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => MainPageController.navigationTab(2),
                    child: Text(
                      "Boutique",
                      style: TextStyle(
                          color:
                              page == 2 ? webActiveMenuBar : webInActiveMenuBar,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => MainPageController.navigationTab(3),
                    child: Text(
                      "Mon compte",
                      style: TextStyle(
                          color:
                              page == 3 ? webActiveMenuBar : webInActiveMenuBar,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () => MainPageController.navigationTab(4),
                    child: Text(
                      "Mentions légales",
                      style: TextStyle(
                          color:
                              page == 4 ? webActiveMenuBar : webInActiveMenuBar,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Basket(),
                  const SizedBox(
                    width: 16,
                  ),
                ],
              ),
            ],
          );
        });
  }
}
