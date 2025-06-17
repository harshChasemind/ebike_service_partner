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
          Image.asset(DoctorPngimage.intro1,height: height/1.65,width: width/1,fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: Column(
              children: [
                Text("Meet Engineers Online".tr,
                    style: ibold.copyWith(
                        fontSize: 18,)),
                SizedBox(height: height/96,),
                Text("We Provide Professional Bikes services at a very friendly price".tr,
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
          Image.asset(DoctorPngimage.intro2,height: height/1.65,width: width/1,fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: Column(
              children: [
                Text("Connect with Experince Team".tr,
                    style: ibold.copyWith(
                      fontSize: 18,)),
                SizedBox(height: height/96,),
                Text("Connect with Specialized Engineering Online for Convenient and Comprehensive Bike Services".tr,
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
          Image.asset(DoctorPngimage.intro4,height: height/1.65,width: width/1,fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: Column(
              children: [
                Text("Thousands of Online Mechanical Engineering".tr,textAlign: TextAlign.center,
                    style: ibold.copyWith(
                      fontSize: 18,)),
                SizedBox(height: height/96,),
                Text("Explore a Vast Array of Online Mechanical Engineering, Offering an Extensive Range of Expertise Services.".tr,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pages.length,
                    (index) {
                  // Ensure we safely get current page index
                  int currentPage = 0;
                  if (pageController.hasClients && pageController.page != null) {
                    currentPage = pageController.page!.round();
                  }

                  bool isSelected = currentPage == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: isSelected ? 30.0 : 8.0,
                    height: isSelected ? 10.0 : 8.0,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? DoctorColor.blueBG
                          : (themedata.isdark ? Colors.white10 : DoctorColor.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: height / 8,
            right: 25,
            left: 25,
            child: InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {
                if (selectedIndex < pages.length - 1) {
                  selectedIndex++;
                  pageController.animateToPage(
                    selectedIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                  setState(() {});
                } else {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorSignin();
                    },
                  ));
                }
              },
              child: Container(
                height: height / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: DoctorColor.blueBG),
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
                Get.to(DoctorSignin());
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
