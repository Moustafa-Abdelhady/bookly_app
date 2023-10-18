import 'package:book_store/features/home/presentaion/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/localization_cubit/local_cubit.dart';

class HomePageView extends StatelessWidget {
 
//  static String id = '/HomePageView';

  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    (context).read<LocalCubit>().changeStartLang();
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeViewBody(),
    );
  }
}
