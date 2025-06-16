import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_splash.dart';
import 'package:doctorappointment/doctor_theme/doctor_theme.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:doctorappointment/doctor_translation/stringtranslation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themedata = Get.put(DoctorThemecontroler());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: themedata.isdark ? DoctorMythemes.darkTheme : DoctorMythemes.lightTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: DoctorApptranslation(),
      locale: const Locale('en', 'US'),
      home: const DoctorSplash(),
    );
  }
}