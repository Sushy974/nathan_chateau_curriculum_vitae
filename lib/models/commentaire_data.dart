class CommentaireData {
  const CommentaireData({
    required this.valeurCommentaire,
    required this.dateDePublication,
    required this.nomUtilisateur,
  });

  final String valeurCommentaire;
  final int dateDePublication;
  final String nomUtilisateur;

  Map<String, dynamic> toJson() {
    return {
      'name': nomUtilisateur,
      'text': valeurCommentaire,
      'date': dateDePublication,
    };
  }
}
