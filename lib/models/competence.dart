class Competence {
  const Competence({
    required this.niveauCompetence,
    required this.nomCompetence,
    required this.uid,
  });

  final String nomCompetence;
  final String uid;
  final double niveauCompetence;

  Map<String, dynamic> toJson() {
    return {
      'niveau_competence': niveauCompetence,
      'nom_competence': nomCompetence,
    };
  }
}
