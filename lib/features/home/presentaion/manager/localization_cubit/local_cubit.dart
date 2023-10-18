import 'dart:ui';

// import 'package:bloc/bloc.dart';
// import 'package:book_store/constans.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// part 'local_state.dart';

class LocalCubit extends Cubit<Locale?> {
  LocalCubit() : super(null);

  void changeStartLang() async {
    SharedPreferences langPrefs = await SharedPreferences.getInstance();
    

    String? langCode = langPrefs.getString('lang') ;
    print(langCode);

    if (langCode != null) {
      emit(Locale(langCode, ''));
    } 
  }

  void changeLang(context, String data) async {
    emit(Locale(data, ''));
    SharedPreferences langPrefs = await SharedPreferences.getInstance();
    await langPrefs.setString('lang', data);
  }
}









  // old way  spacgety way for Language cubit

// LocalCubit()
//       : super(
//           const SelectedLocal(
//             Locale('ar' , 'en'),
//           ),
          
//         );

//   bool toArabic() {
//     emit(const SelectedLocal(Locale('ar')));
//     print('ar :${Intl.getCurrentLocale()}');
//    return Intl.getCurrentLocale() == 'ar';
    
//     //  Locale == Intl.getCurrentLocale();
//   }

//   bool toEnglish() {
//     emit(const SelectedLocal(Locale('en')));
//     print('en: ${Intl.getCurrentLocale()}');
//    return Intl.getCurrentLocale() == 'en';
    
//     //   Locale ==  Intl.getCurrentLocale();
//   }
  