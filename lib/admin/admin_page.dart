import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nathan_chateau_curriculum_vitae/admin/admin_view.dart';
import 'package:nathan_chateau_curriculum_vitae/admin/cubit/admin_cubit.dart';

import '../app_cubit.dart';
import '../custom_textField/custom_appbar.dart';
import '../data_base/crud.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  static MaterialPage page() => const MaterialPage(child: AdminPage());

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        crud: context.read<Crud>(),
        utilisateur: appCubit.state.utilisateur,
      ),
      body: BlocProvider(
        create: (context) => AdminCubit(crud: context.read<Crud>()),
        child: AdminView(),
      ),
    );
  }
}
