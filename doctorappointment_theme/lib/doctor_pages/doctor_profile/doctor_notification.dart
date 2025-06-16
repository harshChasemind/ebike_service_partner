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

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text("Notification".tr,style: isemibold.copyWith(fontSize: 20),),
        leading: Navigator.of(context).canPop() ? IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)) : null,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: DoctorColor.lightDark),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/150),
                  child: Text("1 New".tr,style: isemibold.copyWith(fontSize: 14,color: DoctorColor.white),),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Today".tr,
                    style: iregular.copyWith(fontSize: 16,color: DoctorColor.grey),
                  ),
                  const Spacer(),
                  Text(
                    "Mark all as read".tr,
                    style: ibold.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: height/30,),
              ListView.separated(
                itemCount: name.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: DoctorColor.transparent,
                    highlightColor: DoctorColor.transparent,
                    onTap: () {
                    },
                    child: Row(
                      children: [
                        Image.asset(img[index],height: height/13,width: height/13,),
                        SizedBox(width: width/36,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: width/1.5,
                                    child: Text(name[index],style: ibold.copyWith(fontSize: 16),)),
                                SizedBox(width: width /56,),
                                Text("1h",style: iregular.copyWith(fontSize: 14,color: DoctorColor.grey),),
                              ],
                            ),
                            SizedBox(
                              width: width/1.35,
                                child: Text("You have successfully booked your appointment with Dr. Emily Walker.",maxLines: 2,overflow: TextOverflow.ellipsis,style: iregular.copyWith(fontSize: 13,color: DoctorColor.grey),)),
                          ],
                        )

                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height/36,);
                },
              ),
              SizedBox(height: height/26,),
              Row(
                children: [
                  Text(
                    "YESTERDAY".tr,
                    style: iregular.copyWith(fontSize: 16,color: DoctorColor.grey),
                  ),
                  const Spacer(),
                  Text(
                    "Mark all as read".tr,
                    style: ibold.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: height/30,),
              ListView.separated(
                itemCount: name1.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: DoctorColor.transparent,
                    highlightColor: DoctorColor.transparent,
                    onTap: () {
                    },
                    child: Row(
                      children: [
                        Image.asset(img1[index],height: height/13,width: height/13,),
                        SizedBox(width: width/36,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: width/1.5,
                                    child: Text(name1[index],style: ibold.copyWith(fontSize: 16),)),
                                SizedBox(width: width /56,),
                                Text("1h",style: iregular.copyWith(fontSize: 14,color: DoctorColor.grey),),
                              ],
                            ),
                            SizedBox(
                                width: width/1.35,
                                child: Text("You have successfully booked your appointment with Dr. Emily Walker.",maxLines: 2,overflow: TextOverflow.ellipsis,style: iregular.copyWith(fontSize: 13,color: DoctorColor.grey),)),
                          ],
                        )

                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: height/36,);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
