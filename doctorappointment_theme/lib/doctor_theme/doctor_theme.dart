import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:flutter/material.dart';

class DoctorMythemes {
  static final lightTheme = ThemeData(
    primaryColor: DoctorColor.primary,
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(),
    fontFamily: 'LatoRegular',
    scaffoldBackgroundColor: DoctorColor.background,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: DoctorColor.black),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: iregular.copyWith(
        color: DoctorColor.black,
        fontSize: 16,
      ),
      color: DoctorColor.transparent,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'LatoRegular',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: DoctorColor.white),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: iregular.copyWith(
        color: DoctorColor.white,
        fontSize: 15,
      ),
      color: DoctorColor.transparent,
    ),
  );
}
