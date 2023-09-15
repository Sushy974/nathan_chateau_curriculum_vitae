import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/string_int.dart';

import '../app_cubit.dart';
import '../curriculum_vitae/curriculum_vitae_view.dart';
import '../custom_textField/custom_textField.dart';
import '../shared/constantes/couleurs.dart';
import 'cubit/admin_cubit.dart';

class AdminView extends StatelessWidget {
  AdminView({Key? key}) : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    final adminCubit = context.watch<AdminCubit>();
    final cvData = context.watch<AdminCubit>().cvData;
    return SingleChildScrollView(
      child: Align(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Column(children: [
            CustomTextField(
              initialeValue: cvData.nom,
              onChange: (value) => context.read<AdminCubit>().changeNom(value),
              label: 'nom',
              errorText: adminCubit.state.nom.isNotValid
                  ? adminCubit.state.nom.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              initialeValue: adminCubit.state.prenom.value,
              onChange: (value) =>
                  context.read<AdminCubit>().changePrenom(value),
              label: 'prenom',
              errorText: adminCubit.state.prenom.isNotValid
                  ? adminCubit.state.prenom.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              initialeValue: adminCubit.state.age.value,
              onChange: (value) => context.read<AdminCubit>().changeAge(value),
              label: 'age',
              errorText: adminCubit.state.age.isNotValid
                  ? adminCubit.state.age.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              initialeValue: adminCubit.state.detail.value,
              onChange: (value) =>
                  context.read<AdminCubit>().changeDetail(value),
              label: 'detail',
              errorText: adminCubit.state.detail.isNotValid
                  ? adminCubit.state.detail.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              initialeValue: adminCubit.state.mail.value,
              onChange: (value) => context.read<AdminCubit>().changeMail(value),
              label: 'email',
              errorText: adminCubit.state.mail.isNotValid
                  ? adminCubit.state.mail.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              initialeValue: adminCubit.state.tel.value,
              onChange: (value) => context.read<AdminCubit>().changeTel(value),
              label: 'tel',
              errorText: adminCubit.state.tel.isNotValid
                  ? adminCubit.state.tel.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              initialeValue: adminCubit.state.adresse.value,
              onChange: (value) =>
                  context.read<AdminCubit>().changeAdresse(value),
              label: 'adresse',
              errorText: adminCubit.state.adresse.isNotValid
                  ? adminCubit.state.adresse.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              initialeValue: adminCubit.state.adresseSuite.value,
              onChange: (value) =>
                  context.read<AdminCubit>().changeAdresseSuite(value),
              label: 'adresse suite',
              errorText: adminCubit.state.adresseSuite.isNotValid
                  ? adminCubit.state.adresseSuite.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            ChampCompetencesCustome(datacompetences: DataCompetencesAdmin()),
            ElevatedButton(
                onPressed: context.read<AdminCubit>().isValid &&
                        !adminCubit.state.status.isInProgress
                    ? () {
                        context.read<AdminCubit>().updateCV();
                        context
                            .read<AppCubit>()
                            .changePage(RouteStages.CurriculumVitaePage);
                      }
                    : null,
                child: adminCubit.state.status.isInProgress
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(child: CircularProgressIndicator()))
                    : const Text('Valider Modification')),
          ]),
        ),
      ),
    );
  }
}

class DataCompetencesAdmin extends StatelessWidget implements DataCompetences {
  DataCompetencesAdmin({
    super.key,
  });
  final Color couleurLike = couleurPalette1;
  @override
  Widget build(BuildContext context) {
    final adminCubit = context.watch<AdminCubit>();
    return Expanded(
      child: Column(
        children: [
          Title(
            color: Colors.black,
            child: const Text('Savoire Faire'),
          ),
          ListView.builder(
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
                                padding: const EdgeInsets.all(5.0),
                                child: Text(adminCubit
                                    .state.listCompetence[index].nomCompetence),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: IconButton(
                            onPressed: () => context
                                .read<AppCubit>()
                                .crud
                                .deleteCompetence(
                                    id: adminCubit
                                        .state.listCompetence[index].uid),
                            icon: const Icon(Icons.remove)),
                      ),
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
                            valueColor:
                                AlwaysStoppedAnimation<Color>(couleurPalette4),
                            minHeight: 15,
                            value: adminCubit
                                .state.listCompetence[index].niveauCompetence,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            itemCount: adminCubit.state.listCompetence.length,
          ),
          CustomTextField(
            onChange: (value) =>
                context.read<AdminCubit>().changeNomComp(value),
            label: 'Nom compétence',
            errorText: adminCubit.state.nom.isNotValid
                ? adminCubit.state.nom.error?.text
                : null,
            icon: const Icon(Icons.label_outline_rounded),
          ),
          Slider(
            value: adminCubit.state.niveauCompetence,
            onChanged: (value) =>
                context.read<AdminCubit>().changeNivComp(value),
          ),
          ElevatedButton(
              onPressed: () => context.read<AppCubit>().crud.addCompetence(
                  niveau: adminCubit.state.niveauCompetence,
                  nom: adminCubit.state.nomCompetence),
              child: const Text('Ajouter Compétence'))
        ],
      ),
    );
  }
}
