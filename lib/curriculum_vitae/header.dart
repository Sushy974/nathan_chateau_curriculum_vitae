import 'package:flutter/material.dart';

import '../shared/constantes/couleurs.dart';

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: const DecorationImage(
            colorFilter: ColorFilter.srgbToLinearGamma(),
            fit: BoxFit.cover,
            image: AssetImage("assets/images/dev.png")),
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [couleurPalette3, Colors.transparent]),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
              decoration: BoxDecoration(
                  color: couleurPalette4,
                  borderRadius: BorderRadius.circular(2000)),
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(2000),
                  child: Image.asset(
                    "assets/images/photo_profil.jpg",
                  ))),
        ),
      ]),
    );
  }
}
