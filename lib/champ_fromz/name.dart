import 'package:formz/formz.dart';

enum NameError { nameVide, formatInvalide }

extension NameErrorX on NameError {
  String get text {
    switch (this) {
      case NameError.nameVide:
        return "Le pseudo est vide";
      // case NameError.namePasMajuscule:
      //   return "Le name n'est pas en majuscule";
      case NameError.formatInvalide:
        return "Le pseuoo n'est pas dans un bon format";
    }
  }
}

class Name extends FormzInput<String, NameError> {
  const Name.pure() : super.pure('');
  const Name.dirty({String value = ''}) : super.dirty(value);

  @override
  NameError? validator(String value) {
    if (value.isEmpty) {
      return NameError.nameVide;
    }
    if (!RegExp(r'^[a-zA-Z0-9_-]+$').hasMatch(value)) {
      return NameError.formatInvalide;
    }
    // if (value.toUpperCase() != value) {
    //   return NameError.namePasMajuscule;
    // }

    return null;
  }
}
