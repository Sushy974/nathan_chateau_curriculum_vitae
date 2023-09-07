import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/confirme_pass.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/identifiant.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/name.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/pass.dart';
import 'package:nathan_chateau_curriculum_vitae/custom_textField/custom_textField.dart';
import 'package:nathan_chateau_curriculum_vitae/shared/constantes/couleurs.dart';

import '../app_cubit.dart';
import 'cubit/inscription_cubit.dart';

class InscriptionView extends StatelessWidget {
  const InscriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inscriptionCubit = context.watch<InscriptionCubit>();
    return Align(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            alignment: Alignment.center,
            height: 50,
            width: 350,
            decoration: BoxDecoration(
                color: couleurPalette3,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Text(
              'Inscription',
              style: TextStyle(fontSize: 20, color: couleurPalette1),
            )),
        Container(
          height: 500,
          width: 350,
          decoration: BoxDecoration(
            color: couleurPalette2,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextField(
                      onChange: (value) => context
                          .read<InscriptionCubit>()
                          .changeIdentifiant(value),
                      label: 'E-mail',
                      errorText: inscriptionCubit.state.identifiant.isNotValid
                          ? inscriptionCubit.state.identifiant.error?.text
                          : null,
                      icon: const Icon(Icons.mail_rounded)),
                  CustomTextField(
                      onChange: (value) =>
                          context.read<InscriptionCubit>().changeName(value),
                      label: 'Pseudo',
                      errorText: inscriptionCubit.state.name.isNotValid
                          ? inscriptionCubit.state.name.error?.text
                          : null,
                      icon: const Icon(Icons.account_circle_outlined)),
                  CustomTextField(
                      pass: true,
                      onChange: (value) =>
                          context.read<InscriptionCubit>().changePass(value),
                      label: 'Mot de Passe',
                      errorText: inscriptionCubit.state.pass.isNotValid
                          ? inscriptionCubit.state.pass.error?.text
                          : null,
                      icon: const Icon(Icons.lock)),
                  CustomTextField(
                      pass: true,
                      onChange: (value) => context
                          .read<InscriptionCubit>()
                          .changeComfirmePass(value),
                      label: 'Comfirmer mot de passe',
                      errorText: inscriptionCubit.state.comfirmePass.isNotValid
                          ? inscriptionCubit.state.comfirmePass.error?.text
                          : null,
                      icon: const Icon(Icons.lock_outline_rounded)),
                  ElevatedButton(
                    onPressed: context.read<InscriptionCubit>().isValid &&
                            !inscriptionCubit.state.status.isInProgress
                        ? () =>
                            context.read<InscriptionCubit>().creerUtilisateur(
                                  emailAddress:
                                      inscriptionCubit.state.identifiant.value,
                                  password: inscriptionCubit.state.pass.value,
                                  name: inscriptionCubit.state.name.value,
                                )
                        : null,
                    child: inscriptionCubit.state.status.isInProgress
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: Center(child: CircularProgressIndicator()))
                        : Text('Inscription'),
                  ),
                ]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Deja inscrit ? Connectez-vous ',
              style: TextStyle(fontSize: 15),
            ),
            InkWell(
              onTap: () => context
                  .read<AppCubit>()
                  .changePage(RouteStages.ConnexionPage),
              child: const Text(
                'ici !',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
