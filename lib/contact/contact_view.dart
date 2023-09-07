import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/champ_formz/nom.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/champ_formz/prenom.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/champ_formz/question.dart';
import 'package:nathan_chateau_curriculum_vitae/contact/champ_formz/societe.dart';

import '../custom_textField/custom_textField.dart';
import 'cubit/contact_cubit.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactCubit = context.watch<ContactCubit>();

    return Align(
      alignment: AlignmentDirectional.center,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              icon: const Icon(Icons.account_circle),
              label: 'Votre Nom*',
              onChange: (value) =>
                  context.read<ContactCubit>().changeNom(value),
              errorText: contactCubit.state.nom.isNotValid
                  ? contactCubit.state.nom.error?.text
                  : null,
            ),
            CustomTextField(
              icon: const Icon(Icons.account_circle_outlined),
              label: 'Votre Prenom*',
              onChange: (value) =>
                  context.read<ContactCubit>().changePrenom(value),
              errorText: contactCubit.state.prenom.isNotValid
                  ? contactCubit.state.prenom.error?.text
                  : null,
            ),
            CustomTextField(
              icon: const Icon(Icons.work_rounded),
              onChange: (value) =>
                  context.read<ContactCubit>().changeSociete(value),
              label: 'Votre Societe',
              errorText: contactCubit.state.societe.isNotValid
                  ? contactCubit.state.societe.error?.text
                  : null,
            ),
            CustomTextField(
              icon: const Icon(Icons.comment),
              label: 'Votre Question*',
              large: true,
              onChange: (value) =>
                  context.read<ContactCubit>().changeQuestion(value),
              errorText: contactCubit.state.question.isNotValid
                  ? contactCubit.state.question.error?.text
                  : null,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('* = Champ Obligatoire',
                      style: TextStyle(fontSize: 12)),
                )),
            ElevatedButton(
                onPressed: contactCubit.isValid
                    ? () => contactCubit.submit(
                          entreprise: contactCubit.state.societe.value,
                          text: contactCubit.state.question.value,
                          nomExpediteur: contactCubit.state.nom.value,
                          prenomExpediteur: contactCubit.state.prenom.value,
                        )
                    : null,
                child: const Text('Envoyer')),
          ],
        ),
      ),
    );
  }
}
