import 'package:nathan_chateau_curriculum_vitae/models/competence.dart';

import '../models/commentaire_data.dart';
import '../models/cv_data.dart';
import '../models/like.dart';

abstract class DataBase {
  Future<void> addLike(
      {required String userUid,
      required String competenceUid,
      required List<Like> listLike});

  Future<bool> verifieLike(
      {required String userUid,
      required String competenceUid,
      required List<Like> listLike});

  Future<void> addCommentaire(
      {required String userName, required String text}) async {}
  Future<void> addCompetence(
      {required double niveau, required String nom}) async {}

  Future<void> deleteCommentaire() async {}
  Future<void> deleteCompetence({required String id}) async {}
  Stream<CvData> getCvData();
  Future<void> updateCV(CvData cvData);

  Stream<List<CommentaireData>> getCommentaire();

  Stream<List<Competence>> getCompetence();
  Stream<List<Like>> getLike();
}
