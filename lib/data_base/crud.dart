import 'package:nathan_chateau_curriculum_vitae/data_base/data_base.dart';

import '../models/commentaire_data.dart';
import '../models/competence.dart';
import '../models/cv_data.dart';
import '../models/like.dart';
import '../models/utilisateur.dart';
import 'data_base_auth.dart';

class Crud {
  const Crud({required this.databaseAuth, required this.database});

  final DataBaseAuth databaseAuth;
  final DataBase database;

  Future<void> creerUtilisateur({
    required String name,
    required String emailAddress,
    required String password,
  }) async {
    await databaseAuth.creerUtilisateur(
        emailAddress: emailAddress, password: password, name: name);
  }

  Future<void> authentifier(
    String emailAddress,
    String password,
  ) async {
    await databaseAuth.authentifier(
        emailAddress: emailAddress, password: password);
  }

  void deconnexion() {
    databaseAuth.deconnexion();
  }

  Stream<Utilisateur> utilisateurCourant() {
    return databaseAuth.utilisateurCourrant;
  }

  Future<void> addCommentaire(
      {required String userName, required String text}) async {
    database.addCommentaire(userName: userName, text: text);
  }

  Future<void> deleteCommentaire() async {
    database.deleteCommentaire();
  }

  Stream<List<CommentaireData>> getCommentaire() {
    return database.getCommentaire();
  }

  Stream<List<Competence>> getCompetence() {
    return database.getCompetence();
  }

  Stream<CvData> getCvData() {
    Stream<CvData> cvdata = database.getCvData();
    return cvdata;
  }

  Future<void> updateCV(CvData cvData) async {
    database.updateCV(cvData);
  }

  Stream<List<Like>> getLike() {
    return database.getLike();
  }

  Future<bool> verifieLike(
      {required String userUid,
      required String competenceUid,
      required List<Like> listLike}) {
    return database.verifieLike(
        userUid: userUid, competenceUid: competenceUid, listLike: listLike);
  }

  Future<void> addLike(
      {required String userUid,
      required String competenceUid,
      required List<Like> listLike}) async {
    database.addLike(
      userUid: userUid,
      competenceUid: competenceUid,
      listLike: listLike,
    );
  }
}
