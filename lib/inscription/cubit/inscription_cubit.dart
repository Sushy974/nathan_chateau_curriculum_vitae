import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/confirme_pass.dart';
import 'package:nathan_chateau_curriculum_vitae/data_base/crud.dart';

import '../../champ_fromz/identifiant.dart';
import '../../champ_fromz/name.dart';
import '../../champ_fromz/pass.dart';

part 'inscription_state.dart';

class InscriptionCubit extends Cubit<InscriptionState> with FormzMixin {
  InscriptionCubit({required this.crud})
      : super(InscriptionState(comfirmePass: ComfirmePass.pure())) {
    emit(state.copyWith(
      pass: const Pass.dirty(value: ''),
      identifiant: const Identifiant.dirty(value: ''),
      comfirmePass: ComfirmePass.dirty(
        value: '',
        comfirme: state.pass.value,
      ),
    ));
  }

  final Crud crud;

  void changeIdentifiant(String identifiant) {
    emit(state.copyWith(identifiant: Identifiant.dirty(value: identifiant)));
  }

  void changePass(String pass) {
    emit(state.copyWith(pass: Pass.dirty(value: pass)));
  }

  void changeName(String name) {
    emit(state.copyWith(name: Name.dirty(value: name)));
  }

  void changeComfirmePass(String comfirmePass) {
    emit(state.copyWith(
        comfirmePass: ComfirmePass.dirty(
            value: comfirmePass, comfirme: state.pass.value)));
  }

  Future<void> creerUtilisateur({
    required String name,
    required String emailAddress,
    required String password,
  }) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    crud.creerUtilisateur(
        name: name, emailAddress: emailAddress, password: password);
    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }

  @override
  List<FormzInput> get inputs => [
        state.identifiant,
        state.pass,
      ];
}
