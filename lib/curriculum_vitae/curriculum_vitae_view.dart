// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/commentaire.dart';
import 'package:nathan_chateau_curriculum_vitae/custom_textField/custom_textField.dart';
import 'package:nathan_chateau_curriculum_vitae/shared/constantes/couleurs.dart';

import '../models/cv_data.dart';
import 'cubit/curriculum_vitae_cubit.dart';
import 'header.dart';

class CurriculumVitaeView extends StatelessWidget {
  const CurriculumVitaeView({super.key, required this.cvData});
  final Stream<CvData> cvData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          children: [
            Container(
              //width: 1200,
              decoration: BoxDecoration(color: couleurPalette1),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header(),
                  Ligne1(),
                  Ligne2(),
                  ChampCompetencesCustome(),
                  ChampCommentaireCustome(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ligne1 extends StatelessWidget {
  const Ligne1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final curriculumVitaeCubit = context.watch<CurriculumVitaeCubit>();
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(curriculumVitaeCubit.state.cvData.prenom, softWrap: true),
            Text(curriculumVitaeCubit.state.cvData.nom),
            Text('${curriculumVitaeCubit.state.cvData.age} ans'),
            Text(curriculumVitaeCubit.state.cvData.info1),
          ]),
        ),
        Image.asset('assets/images/codefile.png', scale: 1),
      ]),
    );
  }
}

class Ligne2 extends StatelessWidget {
  const Ligne2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final curriculumVitaeCubit = context.watch<CurriculumVitaeCubit>();
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset('assets/images/screen.png', scale: 1),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(curriculumVitaeCubit.state.cvData.mail, softWrap: true),
            Text(curriculumVitaeCubit.state.cvData.tel.toString()),
            Text(curriculumVitaeCubit.state.cvData.adresse1),
            Text(curriculumVitaeCubit.state.cvData.adresse2),
          ]),
        ),
      ]),
    );
  }
}

class ChampCompetencesCustome extends StatelessWidget {
  const ChampCompetencesCustome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: couleurPalette4,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Align(
              child: Text('Compétences',
                  style: TextStyle(color: couleurPalette1))),
        ),
        Container(
          decoration: BoxDecoration(
            color: couleurPalette2,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DataCompetences(),
            ],
          ),
        )
      ]),
    );
  }
}

class DataCompetences extends StatelessWidget {
  DataCompetences({
    super.key,
  });
  final Color couleurLike = couleurPalette1;
  @override
  Widget build(BuildContext context) {
    final curriculumVitaeCubit = context.watch<CurriculumVitaeCubit>();
    return Expanded(
      child: Column(
        children: [
          Title(
            color: Colors.black,
            child: const Text('Savoire Faire'),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: couleurPalette1,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(curriculumVitaeCubit.state
                                      .listCompetence[index].nomCompetence),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            )
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  couleurPalette3)),
                                      hoverColor: Colors.lightBlueAccent[400],
                                      color: couleurPalette1,
                                      onPressed: () => context
                                          .read<CurriculumVitaeCubit>()
                                          .addLike(
                                              UidCompetence:
                                                  curriculumVitaeCubit
                                                      .state
                                                      .listCompetence[index]
                                                      .uid),
                                      icon: const Icon(
                                          Icons.thumb_up_alt_rounded)),
                                  const SizedBox(
                                    width: 18,
                                  )
                                ],
                              ),
                              Visibility(
                                visible: true,
                                child: Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: couleurPalette1,
                                        borderRadius:
                                            BorderRadius.circular(200)),
                                    child: Align(
                                      child: Text(
                                        curriculumVitaeCubit.state.listLike
                                            .where((element) =>
                                                element.uid_competence ==
                                                curriculumVitaeCubit.state
                                                    .listCompetence[index].uid)
                                            .length
                                            .toString(),
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 60,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: couleurPalette3,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: LinearProgressIndicator(
                              backgroundColor: couleurPalette1,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  couleurPalette4),
                              minHeight: 15,
                              value: curriculumVitaeCubit
                                  .state.listCompetence[index].niveauCompetence,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: curriculumVitaeCubit.state.listCompetence.length,
            ),
          ),
        ],
      ),
    );
  }
}

class ChampCommentaireCustome extends StatelessWidget {
  const ChampCommentaireCustome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final curriculumVitaeCubit = context.watch<CurriculumVitaeCubit>();
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: couleurPalette4,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Align(
                child: Text('Recommandation',
                    style: TextStyle(color: couleurPalette1))),
          ),
          Container(
            decoration: BoxDecoration(
                color: couleurPalette2,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10, top: 10, right: 15, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                color: couleurPalette4,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  curriculumVitaeCubit.state
                                      .listCommentaire[index].nomUtilisateur,
                                  style: TextStyle(
                                      fontSize: 20, color: couleurPalette1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: couleurPalette1),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  curriculumVitaeCubit.state
                                      .listCommentaire[index].valeurCommentaire,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  itemCount: curriculumVitaeCubit.state.listCommentaire.length,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: couleurPalette1,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: CustomTextField(
                        large: true,
                        onChange: (value) => context
                            .read<CurriculumVitaeCubit>()
                            .changeComment(value),
                        label: 'Commentaire',
                        errorText: curriculumVitaeCubit
                                .state.commentaire.isNotValid
                            ? curriculumVitaeCubit.state.commentaire.error?.text
                            : null,
                        icon: const Icon(Icons.comment)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 230,
                    child: ElevatedButton(
                        onPressed: () => context
                            .read<CurriculumVitaeCubit>()
                            .addComment(
                                text: context
                                    .read<CurriculumVitaeCubit>()
                                    .state
                                    .commentaire
                                    .value),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Envoyer le commentaire '),
                            Icon(Icons.send),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
