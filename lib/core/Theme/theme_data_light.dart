import 'package:flutter/material.dart';

ThemeData getThemeDataLight () => ThemeData.light().copyWith(
    scaffoldBackgroundColor:const Color.fromARGB(255, 240, 227, 227),
    // brightness: Brightness.light,
    cardColor:Colors.black45,
    backgroundColor:Colors.black45,
    accentColor:Colors.black45,
    colorScheme:const ColorScheme.light(),
    primaryColor:Colors.black ,
    canvasColor:Colors.black45,

    // primaryColorBrightness:Colors.black45,
    // textTheme:const TextTheme(
    //   titleMedium: TextStyle(color: Colors.black87,backgroundColor:Colors.black12),
    //   titleSmall: TextStyle(color: Colors.black87,backgroundColor:Colors.black12),
    //   titleLarge: TextStyle(color: Colors.black87,backgroundColor:Colors.black12),
    // ),
    
    iconTheme: const IconThemeData(
      opacity:.8,
      color:Colors.black87,
      fill:.8
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all(0),
          foregroundColor:
              MaterialStateProperty.all(Colors.black87.withOpacity(.8)),
          animationDuration: const Duration(milliseconds: 3),
          // minimumSize:const MaterialStatePropertyAll(Size(50, 30)),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    appBarTheme: AppBarTheme(backgroundColor:const Color.fromARGB(220, 243, 229, 229).withOpacity(.9),
     textTheme:const TextTheme(
        titleMedium: TextStyle(color: Colors.black26),
      titleSmall: TextStyle(color: Colors.black26),
      titleLarge: TextStyle(color: Colors.black26),
    ),
    elevation:0,
    iconTheme:const IconThemeData(color:Colors.black87,
    opacity:.8),
    // color: Colors.white70.withOpacity(.9),
    // foregroundColor:Colors.white70.withOpacity(.9),
    ),
     switchTheme:SwitchThemeData(
      trackColor:MaterialStateProperty.all(Colors.grey.shade800),
      thumbColor:MaterialStateProperty.all(Colors.grey.shade600),
    ),
  );
