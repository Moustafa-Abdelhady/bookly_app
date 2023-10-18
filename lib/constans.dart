import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kPrimaryColor = Color(0xff100B20);
const kTransitionDuration = Duration(seconds: 3);
const kGtSectraFine = 'GT Sectra Fine';
 const net=[
    'https://th.bing.com/th/id/R.6be8a7ad5f6fd76d26447aac4995339e?rik=OGnLU0YP1DkUHg&pid=ImgRaw&r=0,'
    ,"https://th.bing.com/th/id/OIP.iZUN1l5c4KFDJl2R2xhM6gHaEK?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/R.81855aaf9831256bfc4fb78c87d0837c?rik=RELzK8FiSnJmUA&pid=ImgRaw&r=0",
    "https://th.bing.com/th/id/OIP.GZfrgP79dmsyndsOpAh-SgHaFj?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/R.f5c764da7b9d442fc6b7d5de6cd92028?rik=infOjulN%2fa4CBQ&riu=http%3a%2f%2favante.biz%2fwp-content%2fuploads%2fNatural-Background-Images%2fNatural-Background-Images-043.jpg&ehk=GAekUpMDjxqo2j7XLQjbuU8rrWbDqoce3Y8K3COBspo%3d&risl=&pid=ImgRaw&r=0"
  ];

   SharedPreferences? sharedPreferences;