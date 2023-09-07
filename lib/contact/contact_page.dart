import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/contact_view.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/cubit/contact_cubit.dart';
import 'package:nathan_chateau_curriculum_vitae/shared/constantes/couleurs.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: couleurPalette4,
        centerTitle: true,
        title: const Text(
          'Contactez - moi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocProvider(
        create: (context) => ContactCubit(),
        child: const ContactView(),
      ),
    );
  }
}
