import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/admin/admin_page.dart';
import 'package:nathan_chateau_curriculum_vitae/connexion/connexion_page.dart';
import 'package:nathan_chateau_curriculum_vitae/inscription/inscription_page.dart';

import '../app_cubit.dart';
import '../curriculum_vitae/curriculum_vitae_page.dart';

List<Page> onGeneratePagesApp(AppState appState, List<Page> pages) {
  switch (appState.routeStages) {
    case RouteStages.CurriculumVitaePage:
      return [CurriculumVitaePage.page()];
    case RouteStages.ConnexionPage:
      return [ConnexionPage.page()];
    case RouteStages.InscriptionPage:
      return [ConnexionPage.page(), InscriptionPage.page()];
    case RouteStages.AdminPage:
      return [AdminPage.page()];
  }
}

class RouteFlow extends StatelessWidget {
  const RouteFlow({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const RouteFlow(),
      );

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<AppState>(
      onGeneratePages: onGeneratePagesApp,
      state: context.select((AppCubit cubit) => cubit.state),
    );
  }
}
