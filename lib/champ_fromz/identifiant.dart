import 'package:formz/formz.dart';

enum IdentifiantError { identifiantVide, formatInvalide }

extension IdentifiantErrorX on IdentifiantError {
  String get text {
    switch (this) {
      case IdentifiantError.identifiantVide:
        return "L' e-mail est vide";

      case IdentifiantError.formatInvalide:
        return "L' e-mail n'est pas dans un bon format";
    }
  }
}

class Identifiant extends FormzInput<String, IdentifiantError> {
  const Identifiant.pure() : super.pure('');
  const Identifiant.dirty({String value = ''}) : super.dirty(value);

  @override
  IdentifiantError? validator(String value) {
    if (value.isEmpty) {
      return IdentifiantError.identifiantVide;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(value)) {
      return IdentifiantError.formatInvalide;
    }

    return null;
  }
}
