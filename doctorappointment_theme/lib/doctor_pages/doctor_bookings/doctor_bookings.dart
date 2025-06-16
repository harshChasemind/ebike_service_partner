import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

class DoctorBookings extends StatefulWidget {
  const DoctorBookings({Key? key}) : super(key: key);

  @override
  State<DoctorBookings> createState() => _DoctorBookingsState();
}

class _DoctorBookingsState extends State<DoctorBookings> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  List name = ["Rahul Sharma", "Rajat Sharma", "Vinay Sharma"];
  List date = [
    "May 22, 2023 - 10.00 AM",
    "Jube 14, 2023 - 15.00pm",
    "June 21, 2023 - 10.00 AM"
  ];
  List img = [
    DoctorPngimage.c2,
    DoctorPngimage.c2,
    DoctorPngimage.c2,
  ];

  List name1 = ["Rahul Sharma", "Rajat Sharma", "Vinay Sharma"];
  List date1 = [
    "March 12, 2023 - 11.00 AM",
    "March 2, 2023 - 12.00 AM",
    "Feb 2, 2023 - 9.00 AM"
  ];
  List img1 = [
    DoctorPngimage.d2,
    DoctorPngimage.d5,
    DoctorPngimage.d4,
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            surfaceTintColor: DoctorColor.white,
            title: Text(
              "My_Bookings".tr,
              style: isemibold.copyWith(
                  fontSize: 20,
                  color:
                      themedata.isdark ? DoctorColor.white : DoctorColor.black),
            ),
            bottom: TabBar(
                unselectedLabelStyle: isemibold.copyWith(
                  color: DoctorColor.grey,
                  fontSize: 16,
                ),
                labelStyle: isemibold.copyWith(
                    fontSize: 16,
                    color: themedata.isdark
                        ? DoctorColor.white
                        : DoctorColor.black),
                indicatorColor:
                    themedata.isdark ? DoctorColor.white : DoctorColor.black,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      "Upcoming".tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Completed".tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Canceled".tr,
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 36),
                  child: Column(
                    children: [
                      ListView.separated(
                        itemCount: name.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: DoctorColor.transparent,
                            highlightColor: DoctorColor.transparent,
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: themedata.isdark
                                      ? DoctorColor.lightblack
                                      : DoctorColor.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        blurRadius: 5.0,
                                        spreadRadius: 3,
                                        offset: Offset(1, 1)),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 36,
                                    vertical: height / 56),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      date[index],
                                      style: ibold.copyWith(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.asset(
                                            img[index],
                                            height: height / 7,
                                            width: height / 7,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 2.35,
                                              child: Text(
                                                name[index],
                                                style: ibold.copyWith(
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Text(
                                              "Ophthalmology".tr,
                                              style: isemibold.copyWith(
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  DoctorPngimage.location,
                                                  height: height / 46,
                                                  color: themedata.isdark
                                                      ? DoctorColor.white
                                                      : DoctorColor.black,
                                                ),
                                                SizedBox(
                                                  width: width / 46,
                                                ),
                                                Text(
                                                  "Golden Cardiology Center".tr,
                                                  style: iregular.copyWith(
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: DoctorColor.transparent,
                                          highlightColor:
                                              DoctorColor.transparent,
                                          onTap: () {},
                                          child: Container(
                                            height: height / 20,
                                            width: width / 2.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: DoctorColor.bgcolor),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width / 22),
                                              child: Center(
                                                child: Text("Cancel".tr,
                                                    style: imedium.copyWith(
                                                        fontSize: 16,
                                                        color:
                                                            DoctorColor.black)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: DoctorColor.transparent,
                                          highlightColor:
                                              DoctorColor.transparent,
                                          onTap: () {},
                                          child: Container(
                                            height: height / 20,
                                            width: width / 2.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: DoctorColor.primary),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width / 22),
                                              child: Center(
                                                child: Text("Reschedule".tr,
                                                    style: imedium.copyWith(
                                                        fontSize: 16,
                                                        color:
                                                            DoctorColor.white)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: height / 56,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 36),
                  child: Column(
                    children: [
                      ListView.separated(
                        itemCount: name1.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: DoctorColor.transparent,
                            highlightColor: DoctorColor.transparent,
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: themedata.isdark
                                      ? DoctorColor.lightblack
                                      : DoctorColor.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        blurRadius: 5.0,
                                        spreadRadius: 3,
                                        offset: Offset(1, 1)),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 36,
                                    vertical: height / 56),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      date1[index],
                                      style: ibold.copyWith(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.asset(
                                            img[index],
                                            height: height / 7,
                                            width: height / 7,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 2.35,
                                              child: Text(
                                                name[index],
                                                style: ibold.copyWith(
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Text(
                                              "Cardiologist".tr,
                                              style: isemibold.copyWith(
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  DoctorPngimage.location,
                                                  height: height / 46,
                                                  color: themedata.isdark
                                                      ? DoctorColor.white
                                                      : DoctorColor.black,
                                                ),
                                                SizedBox(
                                                  width: width / 46,
                                                ),
                                                Text(
                                                  "Golden Cardiology Center".tr,
                                                  style: iregular.copyWith(
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: DoctorColor.transparent,
                                          highlightColor:
                                              DoctorColor.transparent,
                                          onTap: () {},
                                          child: Container(
                                            height: height / 20,
                                            width: width / 2.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: DoctorColor.bgcolor),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width / 22),
                                              child: Center(
                                                child: Text("ReBook".tr,
                                                    style: imedium.copyWith(
                                                        fontSize: 16,
                                                        color:
                                                            DoctorColor.black)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: DoctorColor.transparent,
                                          highlightColor:
                                              DoctorColor.transparent,
                                          onTap: () {},
                                          child: Container(
                                            height: height / 20,
                                            width: width / 2.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: DoctorColor.primary),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width / 22),
                                              child: Center(
                                                child: Text("Add_Review".tr,
                                                    style: imedium.copyWith(
                                                        fontSize: 16,
                                                        color:
                                                            DoctorColor.white)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: height / 56,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 36),
                  child: Column(
                    children: [
                      ListView.separated(
                        itemCount: name.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: DoctorColor.transparent,
                            highlightColor: DoctorColor.transparent,
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: themedata.isdark
                                      ? DoctorColor.lightblack
                                      : DoctorColor.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade100,
                                        blurRadius: 5.0,
                                        spreadRadius: 3,
                                        offset: Offset(1, 1)),
                                  ]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 36,
                                    vertical: height / 56),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      date[index],
                                      style: ibold.copyWith(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.asset(
                                            img[index],
                                            height: height / 7,
                                            width: height / 7,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: width / 2.35,
                                              child: Text(
                                                name[index],
                                                style: ibold.copyWith(
                                                    fontSize: 16),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Text(
                                              "Cardiologist".tr,
                                              style: isemibold.copyWith(
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  DoctorPngimage.location,
                                                  height: height / 46,
                                                  color: themedata.isdark
                                                      ? DoctorColor.white
                                                      : DoctorColor.black,
                                                ),
                                                SizedBox(
                                                  width: width / 46,
                                                ),
                                                Text(
                                                  "Golden Cardiology Center".tr,
                                                  style: iregular.copyWith(
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: height / 96,
                                    ),
                                    InkWell(
                                      splashColor: DoctorColor.transparent,
                                      highlightColor: DoctorColor.transparent,
                                      onTap: () {},
                                      child: Container(
                                        height: height / 20,
                                        width: width / 1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: DoctorColor.primary),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width / 22),
                                          child: Center(
                                            child: Text("Cancel".tr,
                                                style: imedium.copyWith(
                                                    fontSize: 16,
                                                    color: DoctorColor.white)),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: height / 56,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
