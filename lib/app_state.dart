part of 'app_cubit.dart';

enum RouteStages {
  CurriculumVitaePage,
  ConnexionPage,
  InscriptionPage,
  AdminPage,
}

class AppState extends Equatable {
  const AppState({
    this.routeStages = RouteStages.ConnexionPage,
    this.utilisateur = const Utilisateur(id: 'id', name: 'name'),
  });

  final RouteStages routeStages;
  final Utilisateur utilisateur;

  AppState copyWith(
      {required RouteStages? routeStages, Utilisateur? utilisateur}) {
    return AppState(
        routeStages: routeStages ?? this.routeStages,
        utilisateur: utilisateur ?? this.utilisateur);
  }

  @override
  List<Object?> get props => [
        routeStages,
        utilisateur,
      ];
}
