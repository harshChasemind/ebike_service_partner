import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_onboarding.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:nb_utils/nb_utils.dart';

class DoctorSplash extends StatefulWidget {
  const DoctorSplash({Key? key}) : super(key: key);

  @override
  State<DoctorSplash> createState() => _DoctorSplashState();
}

class _DoctorSplashState extends State<DoctorSplash> {
   var isLogin = false;
  @override
  void initState() {
    super.initState();
    getPrefs();
  }

  goup() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 5));


    navigator.push(MaterialPageRoute(
      builder: (context) {
        return const DoctorOnboarding();
      },
    ));
  }
  getPrefs()async{
    await Future.delayed(const Duration(seconds: 5));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getBool("isLogin") != null && sharedPreferences.getString("token") != null ){
      DoctorColor.token = sharedPreferences.getString("token")!;
      isLogin = sharedPreferences.getBool("isLogin")!;
      Get.off(isLogin ? DoctorDashboard(0) : DoctorOnboarding());
    }else{
      Get.off(DoctorOnboarding());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*1,
            color: DoctorColor.primary,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                DoctorPngimage.splash2,
                // fit: BoxFit.fill,
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
              ),
              Text("Partners" , style: ibold.copyWith(fontSize: 45 , color: DoctorColor.white,))
            ],
          ),

          // Center(
          //   child: Image.asset(
          //     DoctorPngimage.icAppLogoWhite,
          //     fit: BoxFit.cover,
          //     width: 130,
          //     // height: 100,
          //   ),
          // ),
        ],
      ),
    );
  }
}
