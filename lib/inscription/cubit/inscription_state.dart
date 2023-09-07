part of 'inscription_cubit.dart';

class InscriptionState extends Equatable {
  InscriptionState({
    required this.comfirmePass,
    this.identifiant = const Identifiant.pure(),
    this.pass = const Pass.pure(),
    this.name = const Name.pure(),
    this.status = FormzSubmissionStatus.initial,
  });

  final FormzSubmissionStatus status;
  final Identifiant identifiant;
  final Pass pass;
  final Name name;
  ComfirmePass comfirmePass = ComfirmePass.pure();

  InscriptionState copyWith({
    Pass? pass,
    Name? name,
    Identifiant? identifiant,
    ComfirmePass? comfirmePass,
    FormzSubmissionStatus? status,
  }) {
    return InscriptionState(
      identifiant: identifiant ?? this.identifiant,
      pass: pass ?? this.pass,
      name: name ?? this.name,
      comfirmePass: comfirmePass ?? this.comfirmePass,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        identifiant,
        pass,
        name,
        comfirmePass,
        status,
      ];
}
