import 'package:formz/formz.dart';

enum QuestionError { nomVide, formatInvalide }

extension QuestionErrorX on QuestionError {
  String get text {
    switch (this) {
      case QuestionError.nomVide:
        return 'La question est vide';
      // case NomError.nomPasMajuscule:
      //   return "Le nom n'est pas en majuscule";
      case QuestionError.formatInvalide:
        return "La question n'est pas dans un bon format\n"
            "(Majuscule, minuscule,chiffre . , ? !)";
    }
  }
}

class Question extends FormzInput<String, QuestionError> {
  const Question.pure() : super.pure('');
  const Question.dirty({String value = ''}) : super.dirty(value);

  @override
  QuestionError? validator(String value) {
    if (value.isEmpty) {
      return QuestionError.nomVide;
    }
    // if (value.toUpperCase() != value) {
    //   return NomError.nomPasMajuscule;
    // }
    if (!RegExp(r'^[\w ?.,!]+$').hasMatch(value)) {
      return QuestionError.formatInvalide;
    }
    return null;
  }
}
