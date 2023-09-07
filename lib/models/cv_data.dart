class CvData {
  const CvData({
    required this.nom,
    required this.prenom,
    required this.age,
    required this.info1,
    required this.mail,
    required this.tel,
    required this.adresse1,
    required this.adresse2,
  });

  final String nom;
  final String prenom;
  final String age;
  final String info1;
  final String mail;
  final String tel;
  final String adresse1;
  final String adresse2;

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'tel': tel,
      'adresse1': adresse1,
      'adresse2': adresse2,
      'age': age,
      'email': mail,
      'info1': info1,
    };
  }
}
