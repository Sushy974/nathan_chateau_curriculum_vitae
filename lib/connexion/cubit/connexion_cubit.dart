import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/data_base/crud.dart';

import '../../champ_fromz/identifiant.dart';
import '../../champ_fromz/pass.dart';

part 'connexion_state.dart';

class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = '',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(
      FirebaseAuthException code) {
    switch (code.code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('Email Invalid');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure('Utilisateur désactivé');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
            'Aucun utilisateur trouvé pour cet e-mail.');
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Mauvais mot de passe fourni pour cet utilisateur.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure('Erreur Iconnue');
    }
  }

  /// The associated error message.
  final String message;
}

class ConnexionCubit extends Cubit<ConnexionState> with FormzMixin {
  ConnexionCubit({required this.crud}) : super(ConnexionState()) {
    emit(state.copyWith(
      pass: const Pass.dirty(value: ''),
      identifiant: const Identifiant.dirty(value: ''),
    ));
  }
  final Crud crud;
  void changeIdentifiant(String identifiant) {
    emit(state.copyWith(identifiant: Identifiant.dirty(value: identifiant)));
  }

  void changePass(String pass) {
    emit(state.copyWith(pass: Pass.dirty(value: pass)));
  }

  Future<void> authentifier({
    required String emailAddress,
    required String password,
  }) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await crud.authentifier(emailAddress, password);
    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }

  @override
  List<FormzInput> get inputs => [
        state.identifiant,
        state.pass,
      ];
}
