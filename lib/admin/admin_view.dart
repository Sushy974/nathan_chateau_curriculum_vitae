import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nathan_chateau_curriculum_vitae/champ_fromz/string_int.dart';

import '../custom_textField/custom_textField.dart';
import 'cubit/admin_cubit.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminCubit = context.watch<AdminCubit>();
    return SingleChildScrollView(
      child: Align(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(children: [
            CustomTextField(
              onChange: (value) => context.read<AdminCubit>().changeNom(value),
              label: 'nom',
              errorText: adminCubit.state.nom.isNotValid
                  ? adminCubit.state.nom.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              onChange: (value) =>
                  context.read<AdminCubit>().changePrenom(value),
              label: 'prenom',
              errorText: adminCubit.state.prenom.isNotValid
                  ? adminCubit.state.prenom.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              onChange: (value) => context.read<AdminCubit>().changeAge(value),
              label: 'age',
              errorText: adminCubit.state.age.isNotValid
                  ? adminCubit.state.age.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              onChange: (value) =>
                  context.read<AdminCubit>().changeDetail(value),
              label: 'detail',
              errorText: adminCubit.state.detail.isNotValid
                  ? adminCubit.state.detail.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              onChange: (value) => context.read<AdminCubit>().changeMail(value),
              label: 'email',
              errorText: adminCubit.state.mail.isNotValid
                  ? adminCubit.state.mail.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              onChange: (value) => context.read<AdminCubit>().changeTel(value),
              label: 'tel',
              errorText: adminCubit.state.tel.isNotValid
                  ? adminCubit.state.tel.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              onChange: (value) =>
                  context.read<AdminCubit>().changeAdresse(value),
              label: 'adresse',
              errorText: adminCubit.state.adresse.isNotValid
                  ? adminCubit.state.adresse.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            CustomTextField(
              onChange: (value) =>
                  context.read<AdminCubit>().changeAdresseSuite(value),
              label: 'adresse suite',
              errorText: adminCubit.state.adresseSuite.isNotValid
                  ? adminCubit.state.adresseSuite.error?.text
                  : null,
              icon: const Icon(Icons.add),
            ),
            ElevatedButton(
                onPressed: context.read<AdminCubit>().isValid &&
                        !adminCubit.state.status.isInProgress
                    ? () => context.read<AdminCubit>().updateCV()
                    : null,
                child: adminCubit.state.status.isInProgress
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(child: CircularProgressIndicator()))
                    : const Text('Valider Modification'))
          ]),
        ),
      ),
    );
  }
}
