import 'package:equatable/equatable.dart';

class Utilisateur extends Equatable {
  const Utilisateur({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
