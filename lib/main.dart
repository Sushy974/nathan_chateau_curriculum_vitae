import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/app_cubit.dart';
import 'package:nathan_chateau_curriculum_vitae/services/route.dart';
import 'package:nathan_chateau_curriculum_vitae/shared/constantes/couleurs.dart';

import 'data_base/crud.dart';
import 'data_base/firestore_data_base.dart';
import 'data_base/firestore_data_base_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final crud = Crud(
        databaseAuth:
            FireStoreDataBaseAuth(firebaseAuth: FirebaseAuth.instance),
        database: FireStoreDataBase(firestore: FirebaseFirestore.instance));

    return RepositoryProvider(
      create: (context) => crud,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: couleurPalette4,
                toolbarHeight: 100,
                actionsIconTheme: IconThemeData(color: couleurPalette4)),
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 40))),
        home: BlocProvider(
          create: (context) => AppCubit(crud: crud),
          child: const RouteFlow(),
        ),
      ),
    );
  }
}
