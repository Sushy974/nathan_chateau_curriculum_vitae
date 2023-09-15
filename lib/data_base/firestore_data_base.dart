import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nathan_chateau_curriculum_vitae/models/cv_data.dart';
import 'package:nathan_chateau_curriculum_vitae/models/date.dart';

import '../models/commentaire_data.dart';
import '../models/competence.dart';
import '../models/like.dart';
import 'data_base.dart';

class FireStoreDataBase implements DataBase {
  FireStoreDataBase({required this.firestore});

  FirebaseFirestore firestore;

  Future<void> addLike(
      {required String userUid,
      required String competenceUid,
      required List<Like> listLike}) async {
    Like likeData =
        Like(uid_competence: competenceUid, uid_utilisateur: userUid);
    CollectionReference like = firestore.collection('like_competence');

    List<Like> likeUtilisateur = listLike
        .where((element) => element.uid_utilisateur == userUid)
        .toList();
    print(likeUtilisateur
        .where((element) => element.uid_competence == competenceUid)
        .toList());
    if (likeUtilisateur
        .where((element) => element.uid_competence == competenceUid)
        .toList()
        .isEmpty) {
      return like
          .add(likeData.toJson())
          .then((value) => print("Like Added"))
          .catchError((error) => print("Failed to add Like: $error"));
    }
    print('deja like');
  }

  Future<bool> verifieLike(
      {required String userUid,
      required String competenceUid,
      required List<Like> listLike}) async {
    List<Like> likeUtilisateur = listLike
        .where((element) => element.uid_utilisateur == userUid)
        .toList();
    if (likeUtilisateur
        .where((element) => element.uid_competence == competenceUid)
        .toList()
        .isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Future<void> addCommentaire(
      {required String userName, required String text}) async {
    print('lance fonction');
    DateTime now = DateTime.now();

    Date dateNow = Date.fromDateTime(
      DateTime(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
      ),
    );
    CommentaireData commentaireData = CommentaireData(
        valeurCommentaire: text,
        dateDePublication: dateNow.toTimestamp(),
        nomUtilisateur: userName);
    CollectionReference commentaire = firestore.collection('commentaire');

    return commentaire
        .add(commentaireData.toJson())
        .then((value) => print("Comment Added"))
        .catchError((error) => print("Failed to add comment: $error"));
  }

  @override
  Future<void> deleteCommentaire() {
    throw UnimplementedError();
  }

  @override
  Stream<List<CommentaireData>> getCommentaire() {
    return firestore.collection('commentaire').snapshots().map((event) => event
        .docs
        .map((e) => CommentaireData(
            dateDePublication: e.data()['date'],
            nomUtilisateur: e.data()['name'],
            valeurCommentaire: e.data()['text']))
        .toList());
  }

  Stream<List<Competence>> getCompetence() {
    return firestore
        .collection('competence_savoire_faire')
        .snapshots()
        .map((event) => event.docs
            .map((e) => Competence(
                  niveauCompetence: e.data()['niveau_competence'],
                  nomCompetence: e.data()['nom_competence'],
                  uid: e.id,
                ))
            .toList());
  }

  Stream<List<Like>> getLike() {
    return firestore
        .collection('like_competence')
        .snapshots()
        .map((event) => event.docs
            .map((e) => Like(
                  uid_competence: e.data()['uid_competence'],
                  uid_utilisateur: e.data()['uid_utilisateur'],
                ))
            .toList());
  }

  @override
  Stream<CvData> getCvData() {
    Stream<CvData> cvdata =
        firestore.collection('cv').snapshots().map((event) => event.docs
            .map((e) => CvData(
                  adresse1: e.data()['adresse1'],
                  adresse2: e.data()['adresse2'],
                  prenom: e.data()['prenom'],
                  nom: e.data()['nom'],
                  age: e.data()['age'],
                  info1: e.data()['info1'],
                  mail: e.data()['email'],
                  tel: e.data()['tel'],
                ))
            .toList()
            .first);
    return cvdata;
  }

  Future<void> updateCV(CvData cvData) async {
    CollectionReference cv = FirebaseFirestore.instance.collection('cv');
    return cv.doc('EM0k3vKITLfyBn69SyhT').update(cvData.toJson());
  }

  @override
  Future<void> deleteCompetence({required String id}) async {
    CollectionReference comp =
        FirebaseFirestore.instance.collection('competence_savoire_faire');
    return comp.doc(id).delete();
  }

  @override
  Future<void> addCompetence(
      {required double niveau, required String nom}) async {
    Competence competence =
        Competence(niveauCompetence: niveau, nomCompetence: nom, uid: '');
    CollectionReference comp = firestore.collection('competence_savoire_faire');
    comp.add(competence.toJson());
  }
}
