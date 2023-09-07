import 'package:firebase_auth/firebase_auth.dart';
import 'package:nathan_chateau_curriculum_vitae/data_base/data_base_auth.dart';
import 'package:nathan_chateau_curriculum_vitae/models/utilisateur.dart';

import '../connexion/cubit/connexion_cubit.dart';

class FireStoreDataBaseAuth implements DataBaseAuth {
  const FireStoreDataBaseAuth({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  @override
  Future<void> authentifier({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      LogInWithEmailAndPasswordFailure.fromCode(e);
      //print(e.code);
    }
    firebaseAuth.authStateChanges().listen((User? user) async {
      if (user == null) {
      } else {}
    });
  }

  @override
  Future<void> creerUtilisateur({
    required String name,
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'weak-password') {
        print('Le mot de passe fourni est trop faible.');
      }
      if (e.code == 'email-already-in-use') {
        print('Le compte existe déjà pour cet e-mail.');
      }
    }
    final user = FirebaseAuth.instance.currentUser;

    await user?.updateDisplayName(name);
    await user?.sendEmailVerification();
  }

  @override
  Stream<Utilisateur> get utilisateurCourrant =>
      firebaseAuth.authStateChanges().map((event) =>
          Utilisateur(id: event?.uid ?? '', name: event?.displayName ?? ''));

  @override
  Future<void> deconnexion() async {
    await FirebaseAuth.instance.signOut();
  }
}
