part of 'connexion_cubit.dart';

class ConnexionState extends Equatable {
  ConnexionState({
    this.identifiant = const Identifiant.pure(),
    this.pass = const Pass.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final FormzSubmissionStatus status;
  final Identifiant identifiant;
  final Pass pass;

  ConnexionState copyWith({
    Pass? pass,
    Identifiant? identifiant,
    FormzSubmissionStatus? status,
  }) {
    return ConnexionState(
      identifiant: identifiant ?? this.identifiant,
      pass: pass ?? this.pass,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        identifiant,
        pass,
        status,
      ];
}
