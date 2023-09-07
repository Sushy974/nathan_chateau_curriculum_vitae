import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nathan_chateau_curriculum_vitae/models/utilisateur.dart';

import 'data_base/crud.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.crud}) : super(const AppState()) {
    crud.utilisateurCourant().listen((event) {
      if (event.id == 'YXFmPro8TxMqkc91fEPHJpLxdae2') {
        emit(state.copyWith(
            routeStages: RouteStages.AdminPage, utilisateur: event));
        return;
      }
      if (event.id == '') {
        emit(state.copyWith(
            routeStages: RouteStages.ConnexionPage, utilisateur: event));
        return;
      }
      emit(state.copyWith(
          routeStages: RouteStages.CurriculumVitaePage, utilisateur: event));
    });
  }
  void changePage(
    RouteStages routeStages,
  ) {
    emit(state.copyWith(
      routeStages: routeStages,
    ));
  }

  final Crud crud;

  void deconnexion() {
    crud.deconnexion();
  }
}
