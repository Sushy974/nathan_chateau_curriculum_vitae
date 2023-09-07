import 'package:formz/formz.dart';

enum NomError { nomVide, formatInvalide }

extension NomErrorX on NomError {
  String get text {
    switch (this) {
      case NomError.nomVide:
        return 'Le nom est vide';
      // case NomError.nomPasMajuscule:
      //   return "Le nom n'est pas en majuscule";
      case NomError.formatInvalide:
        return "Le nom n'est pas dans un bon format";
    }
  }
}

class Nom extends FormzInput<String, NomError> {
  const Nom.pure() : super.pure('');
  const Nom.dirty({String value = ''}) : super.dirty(value);

  @override
  NomError? validator(String value) {
    if (value.isEmpty) {
      return NomError.nomVide;
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return NomError.formatInvalide;
    }
    // if (value.toUpperCase() != value) {
    //   return NomError.nomPasMajuscule;
    // }

    return null;
  }
}
