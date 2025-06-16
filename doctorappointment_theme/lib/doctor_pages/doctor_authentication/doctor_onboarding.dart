import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_signin.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class DoctorOnboarding extends StatefulWidget {
  const DoctorOnboarding({Key? key}) : super(key: key);

  @override
  State<DoctorOnboarding> createState() => _DoctorOnboardingState();
}

class _DoctorOnboardingState extends State<DoctorOnboarding> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  final themedata = Get.put(DoctorThemecontroler());

  var pageController = PageController();
  List<Widget> pages = [];
  var selectedIndex = 0;

  init() {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    pages = [
      Column(
        children: [
          Image.asset(DoctorPngimage.srcreen1,height: height/1.65,width: width/1,fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: Column(
              children: [
                Text("Meet Doctors Online".tr,
                    style: ibold.copyWith(
                        fontSize: 18,)),
                SizedBox(height: height/96,),
                Text("Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.".tr,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: iregular.copyWith(
                      fontSize: 14,)),
              ],
            ),
          )
        ],
      ),
      Column(
        children: [
          Image.asset(DoctorPngimage.screen2,height: height/1.65,width: width/1,fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: Column(
              children: [
                Text("Connect with Specialists".tr,
                    style: ibold.copyWith(
                      fontSize: 18,)),
                SizedBox(height: height/96,),
                Text("Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.".tr,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: iregular.copyWith(
                      fontSize: 14,)),
              ],
            ),
          )
        ],
      ),
      Column(
        children: [
          Image.asset(DoctorPngimage.screen3,height: height/1.65,width: width/1,fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: Column(
              children: [
                Text("Thousands of Online Specialists".tr,
                    style: ibold.copyWith(
                      fontSize: 18,)),
                SizedBox(height: height/96,),
                Text("Connect with Specialized Doctors Online for Convenient and Comprehensive Medical Consultations.".tr,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: iregular.copyWith(
                      fontSize: 14,)),
              ],
            ),
          )
        ],
      )
    ];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    init();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: pages,
            onPageChanged: (index) {
              selectedIndex = index;
              setState(() {});
            },
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            bottom: height / 14,
            left: 8,
            right: 8,
            child: DotIndicator(
                unselectedIndicatorColor: themedata.isdark?Colors.white10:DoctorColor.grey,
                pageController: pageController,
                pages: pages,
                dotSize: 8.00,
                currentDotSize: 10.00,
                indicatorColor: DoctorColor.primary),
          ),
          Positioned(
            bottom: height / 8,
            right: 25,
            left: 25,
            child: InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DoctorSignin();
                  },
                ));
              },
              child: Container(
                height: height / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: DoctorColor.primary),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/22),
                  child: Center(
                    child: Text("Next".tr,
                        style: imedium.copyWith(
                            fontSize: 16, color: DoctorColor.white)),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height / 36,
            right: 5,
            left: 5,
            child: InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {
                /* Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const KidsSignin();
                  },
                ));*/
              },
              child: Center(
                child: Text("Skip".tr,
                    style: iregular.copyWith(
                        fontSize: 14, color:DoctorColor.grey)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
