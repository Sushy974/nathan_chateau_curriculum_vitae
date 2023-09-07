import 'package:nathan_chateau_curriculum_vitae/models/utilisateur.dart';

abstract class DataBaseAuth {
  Stream<Utilisateur> get utilisateurCourrant;

  Future<void> authentifier({
    required String emailAddress,
    required String password,
  }) async {}
  Future<void> creerUtilisateur({
    required String name,
    required String emailAddress,
    required String password,
  }) async {}

  Future<void> deconnexion() async {}
}
