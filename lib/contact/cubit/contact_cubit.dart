import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/champ_formz/nom.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/champ_formz/question.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/champ_formz/societe.dart';

import '../champ_formz/prenom.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> with FormzMixin {
  ContactCubit() : super(ContactState()) {
    emit(state.copyWith(
      nom: const Nom.dirty(value: ''),
      prenom: const Prenom.dirty(value: ''),
      societe: const Societe.dirty(value: ''),
      question: const Question.dirty(value: ''),
    ));
  }

  Future<void> sendMail(
      {required String subject,
      required String nomExpediteur,
      required String prenomExpediteur,
      required String entreprise}) async {
    //     Email([personalization], fromAddress, subject, content: [content]);
  }

  void changeNom(String nom) {
    emit(state.copyWith(nom: Nom.dirty(value: nom)));
  }

  void changePrenom(String prenom) {
    emit(state.copyWith(prenom: Prenom.dirty(value: prenom)));
  }

  void changeSociete(String societe) {
    emit(state.copyWith(societe: Societe.dirty(value: societe)));
  }

  void changeQuestion(String question) {
    emit(state.copyWith(question: Question.dirty(value: question)));
  }

  void submit(
      {required String text,
      required String nomExpediteur,
      required String prenomExpediteur,
      required String entreprise}) {
    if (isNotValid) return;
    print('Envoie du mail');

    // sendMail(
    //     subject: text,
    //     prenomExpediteur: prenomExpediteur,
    //     nomExpediteur: nomExpediteur,
    //     entreprise: entreprise);
    // print(isValid);
    // print(isNotValid);
    // print(state.nom.value);
    // print(state.nom.isValid);
    // print(state.nom.isNotValid);
    // print(state.nom.isPure);
    // print(state.nom.error);
    // print(state.nom.displayError);
  }

  @override
  List<FormzInput> get inputs => [
        state.nom,
        state.prenom,
        state.societe,
        state.question,
      ];
}
