import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/commentaire.dart';
import 'package:nathan_chateau_curriculum_vitae/models/competence.dart';
import 'package:nathan_chateau_curriculum_vitae/models/utilisateur.dart';
import 'package:nathan_chateau_curriculum_vitae/shared/constantes/couleurs.dart';

import '../../data_base/crud.dart';
import '../../models/commentaire_data.dart';
import '../../models/cv_data.dart';
import '../../models/like.dart';

part 'curriculum_vitae_state.dart';

class CurriculumVitaeCubit extends Cubit<CurriculumVitaeState> with FormzMixin {
  CurriculumVitaeCubit({required this.crud, required this.utilisateur})
      : super(CurriculumVitaeState(utilisateur: utilisateur)) {
    streamSubscriptionCommentaire = crud.getCommentaire().listen((event) {
      emit(state.copyWith(listCommentaire: event));
    });
    streamSubscriptionCompetence = crud.getCompetence().listen((event) {
      emit(state.copyWith(listCompetence: event));
    });
    streamSubscriptionLike = crud.getLike().listen((event) {
      emit(state.copyWith(listLike: event));
    });
    streamSubscriptionCV = crud.getCvData().listen((event) {
      emit(state.copyWith(cvData: event));
    });
  }

  final Crud crud;
  final Utilisateur utilisateur;
  late StreamSubscription<List<CommentaireData>> streamSubscriptionCommentaire;
  late StreamSubscription<List<Competence>> streamSubscriptionCompetence;
  late StreamSubscription<List<Like>> streamSubscriptionLike;
  late StreamSubscription<CvData> streamSubscriptionCV;

  Future<void> addComment({required String text}) async {
    await crud.addCommentaire(
        userName: utilisateur.name ?? '', text: text ?? '');
    changeComment('');
  }

  Future<void> addLike({required String UidCompetence}) async {
    await crud.addLike(
        userUid: utilisateur.id,
        competenceUid: UidCompetence,
        listLike: state.listLike);
  }

  Future<Color> verifieLike({required bool condition}) async {
    if (condition == true) {
      return couleurPalette1;
    }
    return Colors.green;
  }

  void changeComment(String comment) {
    emit(state.copyWith(commentaire: Commentaire.dirty(value: comment)));
  }

  @override
  List<FormzInput> get inputs => [
        state.commentaire,
      ];
}
