import 'package:formz/formz.dart';

enum IntFormzError { intFormzVide, formatInvalide }

extension IntFormzErrorX on IntFormzError {
  String get text {
    switch (this) {
      case IntFormzError.intFormzVide:
        return "Le intFormz est vide";

      case IntFormzError.formatInvalide:
        return "Le intFormz n'est pas dans un bon format";
    }
  }
}

class IntFormz extends FormzInput<String, IntFormzError> {
  const IntFormz.pure() : super.pure('');
  const IntFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  IntFormzError? validator(String value) {
    if (value.toString().isEmpty) {
      return IntFormzError.intFormzVide;
    }
    if (!RegExp(r'^[0-9\s]+$').hasMatch(value.toString())) {
      return IntFormzError.formatInvalide;
    }

    return null;
  }
}

enum StringFormzError { stringFormzVide, formatInvalide }

extension StringFormzErrorX on StringFormzError {
  String get text {
    switch (this) {
      case StringFormzError.stringFormzVide:
        return "Le stringFormz est vide";

      case StringFormzError.formatInvalide:
        return "Le stringFormz n'est pas dans un bon format";
    }
  }
}

class StringFormz extends FormzInput<String, StringFormzError> {
  const StringFormz.pure() : super.pure('');
  const StringFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  StringFormzError? validator(String value) {
    if (value.isEmpty) {
      return StringFormzError.stringFormzVide;
    }
    if (!RegExp(r'^[a-zA-Z0-9_@., -]+$').hasMatch(value)) {
      return StringFormzError.formatInvalide;
    }

    return null;
  }
}
