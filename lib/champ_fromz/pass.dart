import 'package:formz/formz.dart';

enum PassError { passVide, formatInvalide }

extension PassErrorX on PassError {
  String get text {
    switch (this) {
      case PassError.passVide:
        return 'Le mot de passe est vide';
      // case PassError.passPasMajuscule:
      //   return "Le pass n'est pas en majuscule";
      case PassError.formatInvalide:
        return "Caractères obligatoire : 1 x lettre majuscule, \n1 x lettre minuscule, \n1 x chiffre, \net un caractère "
            "spéciale(#, \$, %, ^, &, +, =, !)";
    }
  }
}

class Pass extends FormzInput<String, PassError> {
  const Pass.pure() : super.pure('');
  const Pass.dirty({String value = ''}) : super.dirty(value);

  @override
  PassError? validator(String value) {
    if (value.isEmpty) {
      return PassError.passVide;
    }
    if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!\"-])(?!.*\s).{8,}$')
        .hasMatch(value)) {
      return PassError.formatInvalide;
    }

    return null;
  }
}
