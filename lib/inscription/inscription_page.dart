import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/inscription/cubit/inscription_cubit.dart';
import 'package:nathan_chateau_curriculum_vitae/inscription/inscription_view.dart';

import '../data_base/crud.dart';

class InscriptionPage extends StatelessWidget {
  const InscriptionPage({Key? key, this.title}) : super(key: key);
  final String? title;

  static MaterialPage page() => const MaterialPage(child: InscriptionPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        child: const InscriptionView(),
        create: (context) => InscriptionCubit(crud: context.read<Crud>()),
      ),
    );
  }
}
