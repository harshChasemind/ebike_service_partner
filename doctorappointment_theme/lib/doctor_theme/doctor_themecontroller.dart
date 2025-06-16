import 'package:doctorappointment/doctor_globalclass/doctor_prefsname.dart';
import 'package:doctorappointment/doctor_theme/doctor_theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorThemecontroler extends GetxController {
  @override
  void onInit() {
    SharedPreferences.getInstance().then((value) {
      isdark = value.getBool(isDarkMode)!;

      if (isdark) {
        Get.changeTheme(DoctorMythemes.darkTheme);
      } else {
        Get.changeTheme(DoctorMythemes.lightTheme);
      }
      update();
    });
    super.onInit();
  }

  var isdark = false;

  Future<void> changeThem(state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdark = prefs.getBool(isDarkMode) ?? true;
    isdark = !isdark;

    prefs.setBool(isDarkMode, isdark);

    if (state == true) {
      Get.changeTheme(DoctorMythemes.darkTheme);
      isdark = true;
    } else {
      Get.changeTheme(DoctorMythemes.lightTheme);
      isdark = false;
    }
    update();
  }
}
