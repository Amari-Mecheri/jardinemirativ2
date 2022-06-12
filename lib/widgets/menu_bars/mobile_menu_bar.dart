import 'package:flutter/material.dart';

import '../../classes/global_static.dart';
import '../../classes/main_page_controller.dart';
import '../../consts/colors.dart';
import '../basket.dart';

class MobileMenuBar extends StatefulWidget implements PreferredSizeWidget {
  const MobileMenuBar({Key? key}) : super(key: key);

  @override
  State<MobileMenuBar> createState() => _MobileMenuBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MobileMenuBarState extends State<MobileMenuBar> {
  //int _page = 0;

  // void onPageChanged(int page) {
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
                  //Accueil
                  IconButton(
                    onPressed: () => MainPageController.navigationTab(0),
                    icon: Icon(
                      Icons.home,
                      color: page == 0 ? webActiveMenuBar : webInActiveMenuBar,
                    ),
                  ),
                  //Admin
                  IconButton(
                    onPressed: () => MainPageController.navigationTab(1),
                    icon: Icon(
                      Icons.admin_panel_settings,
                      color: page == 1 ? webActiveMenuBar : webInActiveMenuBar,
                    ),
                  ),
                  //Boutique
                  IconButton(
                    onPressed: () => MainPageController.navigationTab(2),
                    icon: Icon(
                      Icons.store,
                      color: page == 2 ? webActiveMenuBar : webInActiveMenuBar,
                    ),
                  ),
                  //Mon Compte
                  IconButton(
                    onPressed: () => MainPageController.navigationTab(3),
                    icon: Icon(
                      Icons.person,
                      color: page == 3 ? webActiveMenuBar : webInActiveMenuBar,
                    ),
                  ),
                  //Mentions légales
                  IconButton(
                    onPressed: () => MainPageController.navigationTab(4),
                    icon: Icon(
                      Icons.handshake,
                      color: page == 4 ? webActiveMenuBar : webInActiveMenuBar,
                    ),
                  ),

                  //Panier
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
