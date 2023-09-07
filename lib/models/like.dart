class Like {
  const Like({
    required this.uid_competence,
    required this.uid_utilisateur,
  });

  final String uid_competence;
  final String uid_utilisateur;

  Map<String, dynamic> toJson() {
    return {
      'uid_competence': uid_competence,
      'uid_utilisateur': uid_utilisateur,
    };
  }
}
