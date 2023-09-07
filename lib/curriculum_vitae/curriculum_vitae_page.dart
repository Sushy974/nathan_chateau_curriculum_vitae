import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/app_cubit.dart';

import '../custom_textField/custom_appbar.dart';
import '../data_base/crud.dart';
import 'cubit/curriculum_vitae_cubit.dart';
import 'curriculum_vitae_view.dart';

class CurriculumVitaePage extends StatelessWidget {
  const CurriculumVitaePage({Key? key, this.title, this.crud})
      : super(key: key);
  final String? title;
  final Crud? crud;

  static MaterialPage page() =>
      const MaterialPage(child: CurriculumVitaePage());

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        crud: context.read<Crud>(),
        utilisateur: appCubit.state.utilisateur,
      ),
      body: BlocProvider(
        create: (context) => CurriculumVitaeCubit(
          crud: context.read<Crud>(),
          utilisateur: appCubit.state.utilisateur,
        ),
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              repeat: ImageRepeat.repeat,
              image: AssetImage('assets/images/repeat.jpg'),
            )),
            child: CurriculumVitaeView(
              cvData: context.read<Crud>().getCvData(),
            )),
      ),
    );
  }
}
