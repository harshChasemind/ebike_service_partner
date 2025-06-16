import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class DoctorBookAppointment extends StatefulWidget {
  const DoctorBookAppointment({Key? key}) : super(key: key);

  @override
  State<DoctorBookAppointment> createState() => _DoctorBookAppointmentState();
}

class _DoctorBookAppointmentState extends State<DoctorBookAppointment> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  DateTime? _selectedDay;
  int? serviceselected;

  List time = ["09.00 AM","09.30 AM","10.00 AM","10.30 AM","11.00 AM","11.30 AM","3.00 PM","3.30 PM","4.00 PM","4.30 PM","5.00 PM","5.30 PM"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text("Book_Appointment".tr,style: isemibold.copyWith(fontSize: 20,color: themedata.isdark?DoctorColor.white:DoctorColor.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select_Date".tr,style: isemibold.copyWith(fontSize: 20),),
              SizedBox(height: height/36,),
              Container(
                decoration: BoxDecoration(
                  color: themedata.isdark?DoctorColor.lightblack:DoctorColor.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  focusedDay: DateTime.now(),
                  lastDay: DateTime.utc(2050, 3, 14),
                  headerVisible: true,
                  daysOfWeekVisible: true,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        color: DoctorColor.primary,
                        borderRadius: BorderRadius.circular(10)),
                    todayTextStyle: const TextStyle(
                      color: DoctorColor.white,
                    ),
                    selectedDecoration: BoxDecoration(
                        color: DoctorColor.primary,
                        borderRadius: BorderRadius.circular(10)),
                    selectedTextStyle: const TextStyle(
                      color: DoctorColor.white,
                    ),
                  ),
                  shouldFillViewport: false,
                  currentDay: _selectedDay,
                  calendarFormat: CalendarFormat.month,
                  pageAnimationEnabled: false,
                  headerStyle: HeaderStyle(
                      headerMargin: EdgeInsets.symmetric(
                          vertical: height / 56, horizontal: width / 36),
                      leftChevronIcon: const Icon(
                        Icons.chevron_left,
                      ),
                      rightChevronIcon: const Icon(
                        Icons.chevron_right,
                      ),
                      formatButtonVisible: false,
                      titleCentered: true,
                      titleTextStyle: iregular.copyWith(
                        fontSize: 12,
                      )),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                ),
              ),
              SizedBox(height: height/36,),
              Text("Select_Hour".tr,style: isemibold.copyWith(fontSize: 20),),
              SizedBox(height: height/36,),
              GridView.builder(
                itemCount: time.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: (height / 2) / (width / 2.6)),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: DoctorColor.transparent,
                    highlightColor: DoctorColor.transparent,
                    onTap: () {
                      setState(() {
                        serviceselected = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: serviceselected == index
                              ? DoctorColor.primary
                              : DoctorColor.bgcolor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 20),
                        child: Center(
                          child: Text(
                            time[index],
                            style: isemibold.copyWith(
                                fontSize: 14,
                                color: serviceselected == index
                                    ? DoctorColor.white
                                    : DoctorColor.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: height/26,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  success();
                },
                child: Container(
                  height: height / 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: DoctorColor.primary),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/22),
                    child: Center(
                      child: Text("Confirm".tr,
                          style: imedium.copyWith(
                              fontSize: 16, color: DoctorColor.white)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  success() async {
    return await showDialog(
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height/56),
              child: Column(
                children: [
                  SizedBox(height: height/36,),
                  Image.asset(DoctorPngimage.success,height: height/7,),
                  SizedBox(height: height/26,),
                  Text("Congratulations!".tr,
                      style: imedium.copyWith(
                        fontSize: 20,)),
                  SizedBox(height: height/96,),
                  Text("Your appointment with Dr. David Patel is confirmed for June 30, 2023, at 10:00 AM.".tr,
                      textAlign: TextAlign.center,
                      style: iregular.copyWith(
                          fontSize: 14,color: DoctorColor.grey)),
                  SizedBox(height: height/26,),
                  InkWell(
                    splashColor: DoctorColor.transparent,
                    highlightColor: DoctorColor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DoctorBookAppointment();
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
                          child: Text("Done".tr,
                              style: imedium.copyWith(
                                  fontSize: 16, color: DoctorColor.white)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height/56,),
                  Text("Edit your appointment ".tr,
                      textAlign: TextAlign.center,
                      style: iregular.copyWith(
                          fontSize: 14,color: DoctorColor.grey)),
                ],
              ),
            )
          ],
        ),
        context: context);
  }

}
