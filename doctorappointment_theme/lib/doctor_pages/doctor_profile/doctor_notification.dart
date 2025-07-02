import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:get/get.dart';

class DoctorNotification extends StatefulWidget {
  const DoctorNotification({Key? key}) : super(key: key);

  @override
  State<DoctorNotification> createState() => _DoctorNotificationState();
}

class _DoctorNotificationState extends State<DoctorNotification> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());

  List img = [
    DoctorPngimage.n1,
    DoctorPngimage.n2,
    DoctorPngimage.n3,
  ];

  List name = ["Appointment Success","Appointment Cancelled","Scheduled Changed"];

  List img1 = [
    DoctorPngimage.n1,
  ];

  List name1 = ["Appointment Success"];
  final Map<String, List<Map<String, String>>> notificationData = {
    "Today": [
      {
        "img":  DoctorPngimage.n1,
        "title": "Appointment Success",
        "message": "You have successfully booked your appointment with Dr. Emily Walker.",
        "time": "1h",
      },
      {
        "img":  DoctorPngimage.n2,
        "title": "Appointment Cancelled",
        "message": "You have successfully booked your appointment with Dr. Emily Walker.",
        "time": "1h",
      },
      {
        "img":  DoctorPngimage.n3,
        "title": "Scheduled Changed",
        "message": "You have successfully booked your appointment with Dr. Emily Walker.",
        "time": "1h",
      },
    ],
    "Yesterday": [
      {
        "img": DoctorPngimage.n1,
        "title": "Appointment Success",
        "message": "You have successfully booked your appointment with Dr. Emily Walker.",
        "time": "1d",
      },
    ]
  };


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text("Notification".tr,style: isemibold.copyWith(fontSize: 20),),
        leading: Navigator.of(context).canPop() ? IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)) : null,
        actions: [
          GestureDetector(
            onTap: (){
              showAppFilterDialog(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: DoctorColor.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/150),
                    child: Image.asset(DoctorPngimage.filter)),
                  )
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: notificationData.entries.map((entry) {
              String sectionTitle = entry.key;
              List<Map<String, String>> items = entry.value;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        sectionTitle.tr,
                        style: iregular.copyWith(fontSize: 16, color: DoctorColor.grey),
                      ),
                      const Spacer(),
                      Text(
                        "Mark all as read".tr,
                        style: ibold.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 30),
                  ListView.separated(
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return InkWell(
                        splashColor: DoctorColor.transparent,
                        highlightColor: DoctorColor.transparent,
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(item["img"]!, height: height / 13, width: height / 13),
                            SizedBox(width: width / 36),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width / 1.5,
                                      child: Text(item["title"]!, style: ibold.copyWith(fontSize: 16)),
                                    ),
                                    SizedBox(width: width / 56),
                                    Text(item["time"]!, style: iregular.copyWith(fontSize: 14, color: DoctorColor.grey)),
                                  ],
                                ),
                                SizedBox(
                                  width: width / 1.35,
                                  child: Text(
                                    item["message"]!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: iregular.copyWith(fontSize: 13, color: DoctorColor.grey),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: height / 36),
                  ),
                  SizedBox(height: height / 26),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
  void showAppFilterDialog(BuildContext context) {
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: DoctorColor.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: Text("Filter", style: ibold.copyWith(fontSize: 18)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Image.asset(DoctorPngimage.n1, height: height / 10, width: width / 10),
                    title: Text("Success", style: iregular),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Handle "Completed" logic
                    },
                  ),
                  ListTile(
                    leading: Image.asset(DoctorPngimage.n2, height: height / 10, width: width / 10),
                    title: Text("Re-scheduled", style: iregular),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Handle "In Progress" logic
                    },
                  ),
                  ListTile(
                    leading: Image.asset(DoctorPngimage.n3, height: height / 10, width: width / 10),
                    title: Text("Canceled", style: iregular),
                    onTap: () {
                      Navigator.pop(context);
                      // TODO: Handle "In Progress" logic
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Image.asset(DoctorPngimage.calendar, height: height / 15, width: width / 15),
                    title: Text(
                      selectedDate != null
                          ? "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                          : "Select Date",
                      style: iregular,
                    ),
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                        // Optional: Handle the selected date immediately
                      }
                    },
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      child: Text("Close", style: ibold),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text("Apply", style: ibold),
                      onPressed: () {
                        Navigator.pop(context);
                        // TODO: Apply filters (Completed/In Progress + Date)
                      },
                    ),
                  ],
                )

              ],
            );
          },
        );
      },
    );
  }

}
