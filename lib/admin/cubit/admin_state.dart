part of 'admin_cubit.dart';

class AdminState extends Equatable {
  AdminState({
    this.status = FormzSubmissionStatus.initial,
    this.prenom = const StringFormz.pure(),
    this.nom = const StringFormz.pure(),
    this.detail = const StringFormz.pure(),
    this.mail = const StringFormz.pure(),
    this.adresse = const StringFormz.pure(),
    this.adresseSuite = const StringFormz.pure(),
    this.age = const IntFormz.pure(),
    this.tel = const IntFormz.pure(),
  });

  final FormzSubmissionStatus status;
  final StringFormz prenom;
  final StringFormz nom;
  final StringFormz detail;
  final StringFormz mail;
  final StringFormz adresse;
  final StringFormz adresseSuite;
  final IntFormz age;
  final IntFormz tel;

  AdminState copyWith({
    StringFormz? prenom,
    StringFormz? nom,
    StringFormz? detail,
    StringFormz? mail,
    StringFormz? adresse,
    StringFormz? adresseSuite,
    IntFormz? age,
    IntFormz? tel,
    FormzSubmissionStatus? status,
  }) {
    return AdminState(
      prenom: prenom ?? this.prenom,
      nom: nom ?? this.nom,
      detail: detail ?? this.detail,
      mail: mail ?? this.mail,
      adresse: adresse ?? this.adresse,
      adresseSuite: adresseSuite ?? this.adresseSuite,
      age: age ?? this.age,
      tel: tel ?? this.tel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
        prenom,
        nom,
        detail,
        mail,
        adresse,
        adresseSuite,
        age,
        tel,
      ];
}
