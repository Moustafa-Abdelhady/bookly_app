import 'package:book_store/core/widgets/custom_loading_indecator_widget.dart';
import 'package:book_store/features/home/presentaion/manager/app_theme_cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constans.dart';
import 'core/Theme/theme_data_dark.dart';
import 'core/Theme/theme_data_light.dart';
import 'core/Theme/themes_state.dart';
import 'core/stripe_payment/stripe_keys.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_docmentaion.dart';
import 'features/home/presentaion/manager/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentaion/manager/localization_cubit/local_cubit.dart';
import 'features/home/presentaion/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'generated/l10n.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              AppThemeCubit()..changeTheme(ThemesState.Initial),
        ),
        BlocProvider(
          create: (context) => LocalCubit(),
        ),
      ],
      child: BlocBuilder<LocalCubit, Locale?>(
        builder: (context, lang) {
          return BlocBuilder<AppThemeCubit, AppThemeState>(
            builder: (context, state) {
              if (state is AppDarkTheme) {
                return MaterialApp.router(
                    locale: lang,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    routerConfig: AppRouter.router,
                    debugShowCheckedModeBanner: false,
                    theme: getThemeDataDark());
              } else if (state is AppLightTheme) {
                return MaterialApp.router(
                    locale: lang,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    routerConfig: AppRouter.router,
                    debugShowCheckedModeBanner: false,
                    theme: getThemeDataLight());
              } else {
                return MaterialApp.router(
                  locale:lang,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  // supportedLocales: S.delegate.supportedLocales,
                  supportedLocales:const [
                     Locale('en' , ''),
                     Locale('ar' , '')
                  ],
                  routerConfig: AppRouter.router,
                  debugShowCheckedModeBanner: false,
                  theme: getThemeDataDark(),
                  darkTheme: getThemeDataDark(),
                  themeMode: ThemeMode.dark,
                );
              }
            },
          );
        },
      ),
    );
  }
}
      
    

// bool isArabic() {
//   return Intl.getCurrentLocale() == 'ar';
// }



    // best practice way to make Localization

//     void main() async {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LanguageCubit(),
//       child: BlocBuilder<LanguageCubit, Locale>(builder: (context, lang) {
//         return MaterialApp(
//           locale: lang,
//           title: 'Localizations Sample App',
//           localizationsDelegates: [
//             AppLocalizations.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: [
//             const Locale('en', ''), // English, no country code
//             const Locale('es', ''), // Spanish, no country code
//             const Locale('tr', ''),
//             const Locale('it', ''),
//           ],
//           home: Home(),
//         );
//       }),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   //Here
//   const Home({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     context.read<LanguageCubit>().changeStartLang();
//     return Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.amberAccent,
//           width: 200,
//           height: 200,
//           child: Column(
//             children: [
//               Text(AppLocalizations.of(context).helloWorld),
//               Divider(),
//               TextButton(
//                 onPressed: () {
//                   context.read<LanguageCubit>().changeLang(context, 'en');
//                 },
//                 child: Text('English'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   context.read<LanguageCubit>().changeLang(context, 'es');
//                 },
//                 child: Text('Espaniol'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   context.read<LanguageCubit>().changeLang(context, 'tr');
//                 },
//                 child: Text('Turkish'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LanguageCubit extends Cubit<Locale> {
//   LanguageCubit() : super(null);

//   void changeStartLang() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String langCode = prefs.getString('lang');
//     print(langCode);
//     if (langCode != null) {
//       emit(Locale(langCode, ''));
//     }
//   }

//   void changeLang(context, String data) async {
//     emit(Locale(data, ''));
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('lang', data);
//   }
// }








// old way if we lost => Spacgety way

//  BlocBuilder<LocalCubit, LocalState>(builder: (context, state) {
      //   if (state is SelectedLocal ) {
      //     if ( Intl.getCurrentLocale() == 'en') {
      //       return BlocBuilder<AppThemeCubit, AppThemeState>(
      //           builder: (context, state) {
      //         if (state is AppDarkTheme) {
      //           return MaterialApp.router(
      //               locale: const Locale("ar"),
      //               localizationsDelegates: const [
      //                 S.delegate,
      //                 GlobalMaterialLocalizations.delegate,
      //                 GlobalWidgetsLocalizations.delegate,
      //                 GlobalCupertinoLocalizations.delegate,
      //               ],
      //               supportedLocales: S.delegate.supportedLocales,
      //               routerConfig: AppRouter.router,
      //               debugShowCheckedModeBanner: false,
      //               theme: getThemeDataDark());
      //         } else if (state is AppLightTheme) {
      //           return MaterialApp.router(
      //               locale: const Locale("ar"),
      //               localizationsDelegates: const [
      //                 S.delegate,
      //                 GlobalMaterialLocalizations.delegate,
      //                 GlobalWidgetsLocalizations.delegate,
      //                 GlobalCupertinoLocalizations.delegate,
      //               ],
      //               supportedLocales: S.delegate.supportedLocales,
      //               routerConfig: AppRouter.router,
      //               debugShowCheckedModeBanner: false,
      //               theme: getThemeDataLight());
      //         } else {
      //           return MaterialApp.router(
      //             locale: const Locale("ar"),
      //             localizationsDelegates: const [
      //               S.delegate,
      //               GlobalMaterialLocalizations.delegate,
      //               GlobalWidgetsLocalizations.delegate,
      //               GlobalCupertinoLocalizations.delegate,
      //             ],
      //             supportedLocales: S.delegate.supportedLocales,
      //             routerConfig: AppRouter.router,
      //             debugShowCheckedModeBanner: false,
      //             theme: getThemeDataDark(),
      //             darkTheme: getThemeDataDark(),
      //             themeMode: ThemeMode.dark,
                 
      //           );
      //         }
      //       });
      //     } else  {
      //       return BlocBuilder<AppThemeCubit, AppThemeState>(
      //           builder: (context, state) {
      //         if (state is AppDarkTheme) {
      //           return MaterialApp.router(
      //               locale: const Locale("en"),
      //               localizationsDelegates: const [
      //                 S.delegate,
      //                 GlobalMaterialLocalizations.delegate,
      //                 GlobalWidgetsLocalizations.delegate,
      //                 GlobalCupertinoLocalizations.delegate,
      //               ],
      //               supportedLocales: S.delegate.supportedLocales,
      //               routerConfig: AppRouter.router,
      //               debugShowCheckedModeBanner: false,
      //               theme: getThemeDataDark());
      //         } else if (state is AppLightTheme) {
      //           return MaterialApp.router(
      //               locale: const Locale("en"),
      //               localizationsDelegates: const [
      //                 S.delegate,
      //                 GlobalMaterialLocalizations.delegate,
      //                 GlobalWidgetsLocalizations.delegate,
      //                 GlobalCupertinoLocalizations.delegate,
      //               ],
      //               supportedLocales: S.delegate.supportedLocales,
      //               routerConfig: AppRouter.router,
      //               debugShowCheckedModeBanner: false,
      //               theme: getThemeDataLight());
      //         } else {
      //           return MaterialApp.router(
      //             locale: const Locale("en"),
      //             localizationsDelegates: const [
      //               S.delegate,
      //               GlobalMaterialLocalizations.delegate,
      //               GlobalWidgetsLocalizations.delegate,
      //               GlobalCupertinoLocalizations.delegate,
      //             ],
      //             supportedLocales: S.delegate.supportedLocales,
      //             routerConfig: AppRouter.router,
      //             debugShowCheckedModeBanner: false,
      //             theme: getThemeDataDark(),
      //             darkTheme: getThemeDataDark(),
      //             themeMode: ThemeMode.dark,
      //             //  ThemeData.dark().copyWith(
      //             //     scaffoldBackgroundColor: kPrimaryColor,
      //             //     textTheme: GoogleFonts.montserratTextTheme(
      //             //         ThemeData.dark().textTheme)),
      //             // routes: {
      //             //   SplashView.id :(context) =>const SplashView(),
      //             //   HomePageView.id : (context) =>const HomePageView(),
      //             // },
      //             // initialRoute: SplashView.id,
      //             // home:const SplashView() ,
      //           );
      //         }
      //       });
      //     }
      //   } else {
      //     return const CustomLoadingIndecator();
      //   }
      // }),
    