import 'package:flutter/material.dart';
import 'package:nathan_chateau_curriculum_vitae/models/utilisateur.dart';
import 'package:nathan_chateau_curriculum_vitae/shared/constantes/couleurs.dart';

import '../data_base/crud.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({required this.crud, required this.utilisateur, super.key})
      : super(actions: [
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.account_circle,
                    color: couleurPalette1,
                    size: 50,
                  )),
              Text(utilisateur.name,
                  style: TextStyle(fontSize: 20, color: couleurPalette1)),
            ],
          ),
          IconButton(
              onPressed: () => crud.deconnexion(),
              icon: Icon(
                Icons.exit_to_app,
                color: couleurPalette1,
                size: 70,
              )),
        ]);
  final Crud crud;
  final Utilisateur utilisateur;
}
