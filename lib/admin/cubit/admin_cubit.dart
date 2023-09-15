import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/string_int.dart';
import 'package:nathan_chateau_curriculum_vitae/models/cv_data.dart';

import '../../data_base/crud.dart';
import '../../models/competence.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> with FormzMixin {
  AdminCubit({required this.crud}) : super(AdminState()) {
    streamSubscriptionCV = crud.getCvData().listen((event) {
      emit(state.copyWith(
        prenom: StringFormz.dirty(value: event.prenom),
        nom: StringFormz.dirty(value: event.nom),
        tel: IntFormz.dirty(value: event.tel),
        detail: StringFormz.dirty(value: event.info1),
        age: IntFormz.dirty(value: event.age),
        mail: StringFormz.dirty(value: event.mail),
        adresse: StringFormz.dirty(value: event.adresse1),
        adresseSuite: StringFormz.dirty(value: event.adresse2),
      ));
      cvData = event;
      print(event.nom);
    });
    streamSubscriptionCompetence = crud.getCompetence().listen((event) {
      emit(state.copyWith(listCompetence: event));
    });
  }

  final Crud crud;
  late CvData cvData;
  late StreamSubscription<CvData> streamSubscriptionCV;
  late StreamSubscription<List<Competence>> streamSubscriptionCompetence;

  void changePrenom(String prenom) {
    emit(state.copyWith(prenom: StringFormz.dirty(value: prenom)));
  }

  void changeNom(String nom) {
    emit(state.copyWith(nom: StringFormz.dirty(value: nom)));
  }

  void changeDetail(String detail) {
    emit(state.copyWith(detail: StringFormz.dirty(value: detail)));
  }

  void changeMail(String mail) {
    emit(state.copyWith(mail: StringFormz.dirty(value: mail)));
  }

  void changeAdresse(String adresse) {
    emit(state.copyWith(adresse: StringFormz.dirty(value: adresse)));
  }

  void changeAdresseSuite(String adresseSuite) {
    emit(state.copyWith(adresseSuite: StringFormz.dirty(value: adresseSuite)));
  }

  void changeAge(String age) {
    emit(state.copyWith(age: IntFormz.dirty(value: age)));
  }

  void changeTel(String tel) {
    emit(state.copyWith(tel: IntFormz.dirty(value: tel)));
  }

  void changeNomComp(String nomComp) {
    emit(state.copyWith(nomCompetence: nomComp));
  }

  void changeNivComp(double nivComp) {
    emit(state.copyWith(niveauCompetence: nivComp));
  }

  void updateCV() {
    CvData cvData = CvData(
      nom: state.nom.value,
      prenom: state.prenom.value,
      age: state.age.value,
      info1: state.detail.value,
      mail: state.mail.value,
      tel: state.tel.value,
      adresse1: state.adresse.value,
      adresse2: state.adresseSuite.value,
    );
    crud.updateCV(cvData);
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [];
}
