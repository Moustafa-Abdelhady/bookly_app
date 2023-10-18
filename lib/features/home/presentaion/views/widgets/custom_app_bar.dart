import 'package:book_store/core/utils/app_router.dart';
import 'package:book_store/features/home/presentaion/manager/app_theme_cubit/app_theme_cubit.dart';
import 'package:book_store/features/home/presentaion/manager/localization_cubit/local_cubit.dart';
import 'package:book_store/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../core/Theme/themes_state.dart';
import '../../../../../core/assets.dart';

bool isDark = true;

class CustomAppBar extends StatelessWidget {
  
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 20),
      child: Row(
        children: [
          const LanguagesButton(),
          const ThemesButton(),
          const Spacer(),
          Image.asset(AssetsData.logo,
              height: 25, color: Theme.of(context).primaryColor),
          const Spacer(),
          const IconButtonSearch()
        ],
      ),
    );
  }
}

class LanguagesButton extends StatelessWidget {
  const LanguagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          child: const Text(
            'EN',
          ),
          onPressed: () {
            print('EN');
            (context).read<LocalCubit>().changeLang(context, 'en');
            // BlocProvider.of<LocalCubit>(context).toEnglish();
          },
        ),
        TextButton(
          child: const Text('AR'),
          onPressed: () {
            print('AR');
            (context).read<LocalCubit>().changeLang(context, 'ar');
            // BlocProvider.of<LocalCubit>(context).toArabic();
          },
        ),
      ],
    );
  }
}

    

class ThemesButton extends StatefulWidget {
  const ThemesButton({super.key});

  @override
  State<ThemesButton> createState() => _ThemesButtonState();
}

class _ThemesButtonState extends State<ThemesButton> {
  @override
  Widget build(BuildContext context) {
    return  
     isDark != false
        ? IconButton(
            onPressed: () {
              BlocProvider.of<AppThemeCubit>(context)
                  .changeTheme(ThemesState.Light);
              setState(() {
                isDark = false;
              });
            },
            icon: const Icon(
              Icons.light_mode_outlined,
            ),
          )
        : IconButton(
            onPressed: () {
              BlocProvider.of<AppThemeCubit>(context)
                  .changeTheme(ThemesState.Dark);
              setState(() {
                isDark = true;
              });
            },
            icon: const Icon(Icons.dark_mode_outlined),
          );
  }
}

class IconButtonSearch extends StatelessWidget {
  const IconButtonSearch({
    super.key,
  });

  // final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        GoRouter.of(context).push(
          AppRouter.kSearchView,
          // extra: bookModel,
        );
      },
      icon: const Icon(
        FontAwesomeIcons.magnifyingGlass,
        size: 20,
      ),
    );
  }
}
