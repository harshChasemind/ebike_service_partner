import 'package:doctorappointment/doctor_pages/doctor_home/doctor_list.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class Ebikehistory extends StatefulWidget {
  const Ebikehistory({super.key});

  @override
  State<Ebikehistory> createState() => _EbikehistoryState();
}

class _EbikehistoryState extends State<Ebikehistory> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  final List<Map<String, dynamic>> transactions = [
    {"name": "Dhaval Patel", "time": "Today at 09:20 am", "amount": "₹570.00"},
    {"name": "Raj Patel", "time": "Today at 09:20 am", "amount": "₹670.00"},
    {"name": "Ishan Patel", "time": "Today at 09:20 am", "amount": "₹255.00"},
    {"name": "Keyur Patel", "time": "Today at 09:20 am", "amount": "₹670.00"},
    {"name": "Keyur Patel", "time": "Today at 09:20 am", "amount": "₹170.00"},
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
              "History".tr,
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: transactions.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          final tx = transactions[index];
                          return Container(
                            width: width / 1,
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Left Icon
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    // color: Color(0xFFDFF8E9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(DoctorPngimage.iconTS , height: 40, width: 40,),
                                ),
                                SizedBox(width: 12),
                                // Name and time
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transactions[index]['name'],
                                        style:
                                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        transactions[index]['time'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Amount
                                Text(
                                  transactions[index]['amount'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: transactions.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          final tx = transactions[index];
                          return Container(
                            width: width / 1,
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Left Icon
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    // color: Color(0xFFDFF8E9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(DoctorPngimage.iconTU , height: 40, width: 40,),
                                ),
                                SizedBox(width: 12),
                                // Name and time
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transactions[index]['name'],
                                        style:
                                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        transactions[index]['time'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Amount
                                Text(
                                  transactions[index]['amount'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: transactions.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          final tx = transactions[index];
                          return Container(
                            width: width / 1,
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Left Icon
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    // color: Color(0xFFDFF8E9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(DoctorPngimage.iconTC , height: 40, width: 40,),
                                ),
                                SizedBox(width: 12),
                                // Name and time
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transactions[index]['name'],
                                        style:
                                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        transactions[index]['time'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Amount
                                Text(
                                  transactions[index]['amount'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
