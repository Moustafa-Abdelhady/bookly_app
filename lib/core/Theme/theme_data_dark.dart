import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constans.dart';

ThemeData getThemeDataDark() => ThemeData.dark().copyWith(
      scaffoldBackgroundColor: kPrimaryColor,
      brightness: Brightness.dark,
      primaryColor:Colors.white ,
      textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      // textTheme: const TextTheme(
      //   titleMedium: TextStyle(color: Colors.white),
      //   titleSmall: TextStyle(color: Colors.white),
      //   titleLarge: TextStyle(color: Colors.white),
      // ),
      iconTheme: const IconThemeData(
        opacity: .9,
        color: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all(0),
          foregroundColor:
              MaterialStateProperty.all(Colors.white.withOpacity(.9)),
          animationDuration: const Duration(milliseconds: 3),
          // minimumSize:const MaterialStatePropertyAll(Size(50, 30)),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent.withOpacity(.9),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white70, opacity: .8),
        textTheme: const TextTheme(
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        foregroundColor: Colors.white70.withOpacity(.9),
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.white70),
        thumbColor: MaterialStateProperty.all(Colors.white30),
      ),
    );
