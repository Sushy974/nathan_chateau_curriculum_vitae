part of 'contact_cubit.dart';

class ContactState extends Equatable {
  ContactState({
    this.nom = const Nom.pure(),
    this.prenom = const Prenom.pure(),
    this.societe = const Societe.pure(),
    this.question = const Question.pure(),
  });

  final Nom nom;
  final Prenom prenom;
  final Societe societe;
  final Question question;
  final List listEmploye = [];

  ContactState copyWith({
    Nom? nom,
    Prenom? prenom,
    Societe? societe,
    Question? question,
  }) {
    return ContactState(
        nom: nom ?? this.nom,
        prenom: prenom ?? this.prenom,
        societe: societe ?? this.societe,
        question: question ?? this.question);
  }

  @override
  List<Object> get props => [
        nom,
        prenom,
        societe,
        question,
      ];
}
