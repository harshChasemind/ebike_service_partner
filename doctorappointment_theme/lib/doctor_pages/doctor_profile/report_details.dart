import 'package:doctorappointment/doctor_pages/doctor_home/doctor_book_appointment.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportDetails extends StatefulWidget {
  const ReportDetails({Key? key}) : super(key: key);

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text("Paitent Report".tr,style: isemibold.copyWith(fontSize: 20,color: themedata.isdark?DoctorColor.white:DoctorColor.black),),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36),
            child: Image.asset(
              DoctorPngimage.unlike,
              height: height / 46,
              color: themedata.isdark?DoctorColor.white:DoctorColor.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: themedata.isdark?DoctorColor.lightblack:DoctorColor.white,
                  borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 5.0,
                      spreadRadius: 3,
                      offset: Offset(1, 1)
                    ),]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/80),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(DoctorPngimage.d1,height: height/9,width: height/9,fit: BoxFit.fill,),
                      ),
                      SizedBox(width: width/36,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width/2.35,
                            child: Text(
                              "Rajat Sharma".tr,
                              style: ibold.copyWith(fontSize: 16),
                            ),
                          ),

                          SizedBox(height: height/96,),
                          Container(
                              height: height / 500,
                              width: width / 2,
                              color: DoctorColor.bgcolor),
                          SizedBox(height: height/96,),
                          Text(
                            "Ophthalmology".tr,
                            style: isemibold.copyWith(fontSize: 14),
                          ),
                          // SizedBox(height: height/96,),
                          /*Row(
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
                                style: iregular.copyWith(fontSize: 14),
                              ),
                            ],
                          ),*/
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.user2,
                          height: height / 30,
                          color: DoctorColor.black,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("2,000+".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("BP".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.medal,
                          height: height / 30,
                          color: DoctorColor.black,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("10+".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("CBC".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.starfill,
                          height: height / 30,
                          color: DoctorColor.black,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("5".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("rating".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.messages,
                          height: height / 30,
                          color: DoctorColor.black,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("1,872".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("reviews".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  )
                ],
              ),
              SizedBox(height: height/36,),
              Text("About Rajat".tr,style: isemibold.copyWith(fontSize: 20,),),
              SizedBox(height: height/56,),
              Text("Dr. Shamresh Shrivastav, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate, CA. view more".tr,style: iregular.copyWith(fontSize: 14,),),
              SizedBox(height: height/36,),
              Text("Reports".tr,style: isemibold.copyWith(fontSize: 20,),),
              SizedBox(height: height/56,),
              Text("Monday-Friday, 08.00 AM-18.00 pM".tr,style: iregular.copyWith(fontSize: 14,),),
              SizedBox(
                height: height / 36,
              ),
              /*Row(
                children: [
                  Text(
                    "Reviews".tr,
                    style: isemibold.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "See_All".tr,
                    style: imedium.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              SizedBox(
                height: height/6,
                child: ListView.separated(
                  itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(DoctorPngimage.d1),
                              ),
                              SizedBox(width: width/36,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Emily Anderson".tr,
                                    style: ibold.copyWith(fontSize: 16),
                                  ),
                                  SizedBox(height: height/120,),
                                  Row(
                                    children: [
                                      Text(
                                        "5.0".tr,
                                        style: isemibold.copyWith(fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: width / 46,
                                      ),
                                      Image.asset(
                                        DoctorPngimage.star5,
                                        height: height / 56,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: height/56,),
                          SizedBox(
                            width: width/1.08,
                            child: Text(
                              "Dr. Patel is a true professional who genuinely cares about his patients. I highly recommend Dr. Patel to".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: iregular.copyWith(fontSize: 14),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width/36,);
                    },
                    ),
              ),
              SizedBox(
                height: height / 36,
              ),*/
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  openPdfInBrowser('https://cdn1.lalpathlabs.com/live/reports/WM17S.pdf');
                },
                child: Container(
                  height: height / 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: DoctorColor.primary),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/22),
                    child: Center(
                      child: Text("Download Report".tr,
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

  Future<void> openPdfInBrowser(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
