import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MenuBar extends StatefulWidget implements PreferredSizeWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MenuBarState extends State<MenuBar> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    //getUsername();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTab(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            'logo.png',
            //color: Colors.orangeAccent,
            height: 40,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => navigationTab(0),
          child: Text(
            "Accueil",
            style: TextStyle(
                color: _page == 0 ? webActiveMenuBar : webInActiveMenuBar,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () => navigationTab(1),
          child: Text(
            "Boutique",
            style: TextStyle(
                color: _page == 1 ? webActiveMenuBar : webInActiveMenuBar,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () => navigationTab(2),
          child: Text(
            "Mon compte",
            style: TextStyle(
                color: _page == 2 ? webActiveMenuBar : webInActiveMenuBar,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () => navigationTab(3),
          child: Text(
            "Mentions légales",
            style: TextStyle(
                color: _page == 3 ? webActiveMenuBar : webInActiveMenuBar,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 32,
        ),
        InkWell(
            child: Image.asset('image/basket.png', width: 28),
            onTap: () => navigationTab(4)),
        const SizedBox(
          width: 16,
        ),
        // TextButton(
        //   onPressed: () => navigationTab(4),
        //   child: Text(
        //     "🛒",
        //     style: TextStyle(
        //         color: _page == 4 ? webActiveMenuBar : webInActiveMenuBar,
        //         fontWeight: FontWeight.bold),
        //   ),
        // ),
      ],
    );
  }
}
