import 'package:formz/formz.dart';

enum PrenomError { prenomVide, formatInvalide }

extension PrenomErrorX on PrenomError {
  String get text {
    switch (this) {
      case PrenomError.prenomVide:
        return 'Le prennom est vide';
      // case NomError.nomPasMajuscule:
      //   return "Le nom n'est pas en majuscule";
      case PrenomError.formatInvalide:
        return "Le prenom n'est pas dans un bon format";
    }
  }
}

class Prenom extends FormzInput<String, PrenomError> {
  const Prenom.pure() : super.pure('');
  const Prenom.dirty({String value = ''}) : super.dirty(value);

  @override
  PrenomError? validator(String value) {
    if (value.isEmpty) {
      return PrenomError.prenomVide;
    }
    // if (value.toUpperCase() != value) {
    //   return NomError.nomPasMajuscule;
    // }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return PrenomError.formatInvalide;
    }
    return null;
  }
}
