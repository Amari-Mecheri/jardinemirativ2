import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 14.0, bottom: 14.0),
              child: Text('Rejoingnez-nous sur'),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Snapchat",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const VerticalDivider(
                      color: Colors.white, width: 15, thickness: 1),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Facebook",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const VerticalDivider(
                      color: Colors.white, width: 15, thickness: 1),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Instagram",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3 * 14,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Mentions légales",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const VerticalDivider(
                      color: Colors.white, width: 10, thickness: 1),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Conditions général d'utilisation",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const VerticalDivider(
                      color: Colors.white, width: 10, thickness: 1),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Confidentialité",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// <footer class="nga-footer">

//   <div class="navBottom">
//     <div class="rejoindre">
//         Rejoingnez-nous sur
//     </div>
//     <div class="link">
//         <div class="nav-link-bottom" href="">Snapchat</div>
//         <div class="verticalbar">&nbsp;</div>
//         <div class="nav-link-bottom" href="">Facebook</div>
//         <div class="verticalbar">&nbsp;</div>
//         <div class="nav-link-bottom" href="">Instagram</div>
//     </div>
//     <div class="link2">
//         <div class="nav-link-bottom" href="">Mentions légales</div>
//         <div class="verticalbar2">&nbsp;</div>
//         <div class="nav-link-bottom" href="">Conditions général d'utilisation</div>
//         <div class="verticalbar2">&nbsp;</div>
//         <div class="nav-link-bottom" href="">Confidentialité</div>
//     </div>
// </div>

// </footer>