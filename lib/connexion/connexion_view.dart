import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/identifiant.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/pass.dart';
import 'package:nathan_chateau_curriculum_vitae/custom_textField/custom_textField.dart';
import 'package:nathan_chateau_curriculum_vitae/shared/constantes/couleurs.dart';

import '../app_cubit.dart';
import 'cubit/connexion_cubit.dart';

class ConnexionView extends StatelessWidget {
  const ConnexionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connexionCubit = context.watch<ConnexionCubit>();
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
              'Connexion',
              style: TextStyle(fontSize: 20, color: couleurPalette1),
            )),
        Container(
          height: 400,
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
                          .read<ConnexionCubit>()
                          .changeIdentifiant(value),
                      label: 'E-mail',
                      errorText: connexionCubit.state.identifiant.isNotValid
                          ? connexionCubit.state.identifiant.error?.text
                          : null,
                      icon: const Icon(Icons.mail_rounded)),
                  CustomTextField(
                      pass: true,
                      onChange: (value) =>
                          context.read<ConnexionCubit>().changePass(value),
                      label: 'Mot de Passe',
                      errorText: connexionCubit.state.pass.isNotValid
                          ? connexionCubit.state.pass.error?.text
                          : null,
                      icon: const Icon(Icons.lock)),
                  ElevatedButton(
                      onPressed: context.read<ConnexionCubit>().isValid &&
                              !connexionCubit.state.status.isInProgress
                          ? () => context.read<ConnexionCubit>().authentifier(
                              emailAddress: context
                                  .read<ConnexionCubit>()
                                  .state
                                  .identifiant
                                  .value,
                              password: context
                                  .read<ConnexionCubit>()
                                  .state
                                  .pass
                                  .value)
                          : null,
                      child: connexionCubit.state.status.isInProgress
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: Center(child: CircularProgressIndicator()))
                          : const Text('Connexion'))
                ]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pas de compte ? Inscrivez vous ',
              style: TextStyle(fontSize: 15),
            ),
            InkWell(
              onTap: () => context
                  .read<AppCubit>()
                  .changePage(RouteStages.InscriptionPage),
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
