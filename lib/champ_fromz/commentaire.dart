import 'package:formz/formz.dart';

enum CommentaireError { commentaireVide, formatInvalide }

extension CommentaireErrorX on CommentaireError {
  String get text {
    switch (this) {
      case CommentaireError.commentaireVide:
        return "Le commentaire est vide";

      case CommentaireError.formatInvalide:
        return "Le commentaire n'est pas dans un bon format";
    }
  }
}

class Commentaire extends FormzInput<String, CommentaireError> {
  const Commentaire.pure() : super.pure('');
  const Commentaire.dirty({String value = ''}) : super.dirty(value);

  @override
  CommentaireError? validator(String value) {
    if (value.isEmpty) {
      return CommentaireError.commentaireVide;
    }
    if (!RegExp(r'^[\w\s.,!?()\-]*$').hasMatch(value)) {
      return CommentaireError.formatInvalide;
    }

    return null;
  }
}
