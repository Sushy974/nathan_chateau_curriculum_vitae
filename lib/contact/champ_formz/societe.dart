import 'package:formz/formz.dart';

enum SocieteError { formatInvalide }

extension SocieteErrorX on SocieteError {
  String get text {
    switch (this) {
      // case NomError.nomPasMajuscule:
      //   return "Le nom n'est pas en majuscule";
      case SocieteError.formatInvalide:
        return "La société n'est pas dans un bon format";
    }
  }
}

class Societe extends FormzInput<String, SocieteError> {
  const Societe.pure() : super.pure('');
  const Societe.dirty({String value = ''}) : super.dirty(value);

  @override
  SocieteError? validator(String value) {
    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value)) {
      return SocieteError.formatInvalide;
    }
    // if (value.isEmpty) {
    //   return SocieteError.societeVide;
    // }
    // if (value.toUpperCase() != value) {
    //   return NomError.nomPasMajuscule;
    // }

    return null;
  }
}
