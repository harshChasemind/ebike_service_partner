import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_bookings/doctor_bookings.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_home.dart';
import 'package:doctorappointment/doctor_pages/doctor_location/doctor_location.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/doctor_notification.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../UserListScreens/SubpartnersList.dart';
import '../../doctor_theme/doctor_themecontroller.dart';
import '../doctor_profile/ebikewallet.dart';
import 'OrderHistory.dart';

// ignore: must_be_immutable
class DoctorDashboard extends StatefulWidget {
  final int index;

  DoctorDashboard(this.index, {super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());

  PageController pageController = PageController();
  int _selectedItemIndex = 0;

  final List<Widget> _pages = [
    DoctorHome(),
    Ebikewallet(),
    Orderhistory(),
    DoctorProfile()
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<bool> onbackpressed() async {
    return await showModalBottomSheet(
        context: context,
        backgroundColor: themedata.isdark ?DoctorColor.black : DoctorColor.background,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
                child: Column(
                  children: [
                    Text(
                      "E-Bike Service".tr,
                      style: isemibold.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: height/96,),
                    const Divider(),
                    SizedBox(height: height/96,),
                    Text(
                      "Are you sure you want to exit app".tr,
                      style: iregular.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: height/36,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: DoctorColor.transparent,
                          highlightColor: DoctorColor.transparent,
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: height / 20,
                            width: width/2.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: DoctorColor.bgcolor),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width/22),
                              child: Center(
                                child: Text("Cancel".tr,
                                    style: imedium.copyWith(
                                        fontSize: 16, color: DoctorColor.black)),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: DoctorColor.transparent,
                          highlightColor: DoctorColor.transparent,
                          onTap: () {
                            // Get.to(() => const DoctorSignin());
                            SystemNavigator.pop();
                          },
                          child: Container(
                            height: height / 20,
                            width: width/2.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: DoctorColor.primary),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: width/22),
                              child: Center(
                                child: Text("Yes".tr,
                                    style: imedium.copyWith(
                                        fontSize: 16, color: DoctorColor.white)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
          );
        });
  }

  Widget _bottomTabBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: themedata.isdark ? DoctorColor.black : DoctorColor.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: DoctorColor.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.home,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            backgroundColor: DoctorColor.lightgray,
            radius: 25,
            child: Image.asset(
              DoctorPngimage.homefill,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.iconWallet,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            radius: 25,
            backgroundColor: DoctorColor.lightgray,
            child: Image.asset(
              DoctorPngimage.iconWallet2,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.calendar,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            radius: 25,
            backgroundColor: DoctorColor.lightgray,
            child: Image.asset(
              DoctorPngimage.calendarfill,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            DoctorPngimage.profile,
            height: height / 36,
            color: DoctorColor.textgrey,
          ),
          activeIcon: CircleAvatar(
            radius: 25,
            backgroundColor: DoctorColor.lightgray,
            child: Image.asset(
              DoctorPngimage.profilefill,
              height: height / 36,
              color: DoctorColor.primary,
            ),
          ),
          label: '',
        ),
      ],
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: onbackpressed,
      child: GetBuilder<DoctorThemecontroler>(builder: (controller) {
        return Scaffold(
          bottomNavigationBar: _bottomTabBar(),
          body: _pages[_selectedItemIndex],
        );
      }),
    );
  }
}
