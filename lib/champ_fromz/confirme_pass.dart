import 'package:formz/formz.dart';

enum ComfirmePassError { comfirmePassVide, formatInvalide }

extension ComfirmePassErrorX on ComfirmePassError {
  String get text {
    switch (this) {
      case ComfirmePassError.formatInvalide:
        return "Les deux mot de passe ne correspondent pas";
      case ComfirmePassError.comfirmePassVide:
        return 'Le mot de passe est vide';
    }
  }
}

class ComfirmePass extends FormzInput<String, ComfirmePassError> {
  ComfirmePass.pure() : super.pure('');
  ComfirmePass.dirty({String value = '', required this.comfirme})
      : super.dirty(value);

  String? comfirme;

  @override
  ComfirmePassError? validator(String value) {
    if (value != comfirme) {
      print('value : $value');
      print('');
      return ComfirmePassError.formatInvalide;
    }
    if (value.isEmpty) {
      return ComfirmePassError.comfirmePassVide;
    }

    return null;
  }
}
