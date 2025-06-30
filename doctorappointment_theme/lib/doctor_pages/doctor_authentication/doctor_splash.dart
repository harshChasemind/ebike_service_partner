import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_onboarding.dart';
import 'package:flutter/material.dart';

class DoctorSplash extends StatefulWidget {
  const DoctorSplash({Key? key}) : super(key: key);

  @override
  State<DoctorSplash> createState() => _DoctorSplashState();
}

class _DoctorSplashState extends State<DoctorSplash> {
  @override
  void initState() {
    super.initState();
    goup();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            DoctorPngimage.splash2,
            // fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
