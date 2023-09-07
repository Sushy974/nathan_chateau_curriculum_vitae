part of 'curriculum_vitae_cubit.dart';

class CurriculumVitaeState extends Equatable {
  const CurriculumVitaeState({
    required this.utilisateur,
    this.commentaire = const Commentaire.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.listCommentaire = const [],
    this.listCompetence = const [],
    this.listLike = const [],
    this.cvData = const CvData(
        nom: '',
        prenom: '',
        age: '',
        info1: '',
        mail: '',
        tel: '',
        adresse1: '',
        adresse2: ''),
  });

  final Utilisateur utilisateur;
  final Commentaire commentaire;
  final FormzSubmissionStatus status;
  final List<CommentaireData> listCommentaire;
  final List<Competence> listCompetence;
  final List<Like> listLike;
  final CvData cvData;

  CurriculumVitaeState copyWith({
    Commentaire? commentaire,
    FormzSubmissionStatus? status,
    List<CommentaireData>? listCommentaire,
    List<Competence>? listCompetence,
    List<Like>? listLike,
    CvData? cvData,
  }) {
    return CurriculumVitaeState(
      commentaire: commentaire ?? this.commentaire,
      status: status ?? this.status,
      utilisateur: this.utilisateur,
      listCommentaire: listCommentaire ?? this.listCommentaire,
      listCompetence: listCompetence ?? this.listCompetence,
      listLike: listLike ?? this.listLike,
      cvData: cvData ?? this.cvData,
    );
  }

  @override
  List<Object?> get props => [
        status,
        commentaire,
        utilisateur,
        listCommentaire,
        listCompetence,
        listLike,
        cvData,
      ];
}
