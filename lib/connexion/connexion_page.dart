import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/connexion/connexion_view.dart';
import 'package:nathan_chateau_curriculum_vitae/connexion/cubit/connexion_cubit.dart';
import 'package:nathan_chateau_curriculum_vitae/data_base/crud.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({Key? key, this.title}) : super(key: key);
  final String? title;

  static MaterialPage page() => const MaterialPage(child: ConnexionPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        child: const ConnexionView(),
        create: (context) => ConnexionCubit(crud: context.read<Crud>()),
      ),
    );
  }
}
