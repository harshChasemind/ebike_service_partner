import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

class DoctorLocation extends StatefulWidget {
  const DoctorLocation({Key? key}) : super(key: key);

  @override
  State<DoctorLocation> createState() => _DoctorLocationState();
}

class _DoctorLocationState extends State<DoctorLocation> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());

  List img2 = [
    DoctorPngimage.m1,
    DoctorPngimage.m2,
    DoctorPngimage.m1,
    DoctorPngimage.m2,
  ];

  List name = ["Sunrise Health Clinic","Golden Cardiology Center","Sunrise Health Clinic","Golden Cardiology Center"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(DoctorPngimage.map,width: width/1,height: height/1,fit: BoxFit.fill,),
          Positioned(
            top: height/20,
            right: width/36,
            left: width/36,
            child: TextFormField(
              scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              style: iregular.copyWith(
                  fontSize: 14, color: DoctorColor.textgrey),
              decoration: InputDecoration(
                hintText: 'Search Doctor, Hospital'.tr,
                fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.white,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    DoctorPngimage.search,
                    height: height / 36,
                  ),
                ),
                hintStyle: iregular.copyWith(
                    fontSize: 14, color: DoctorColor.textgrey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              )),),
          Positioned(
            bottom: height/36,
            left: width/36,
            right: width/36,
              child: SizedBox(
                height: height/2.8,
                child: ListView.separated(
                  itemCount: img2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width/1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8)),
                                child: Image.asset(img2[index],width: width/1.5,height: height/6,fit: BoxFit.fill,),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0x331F2A37),
                                  radius: 18,
                                  child: Image.asset(
                                    DoctorPngimage.unlike,
                                    height: height / 46,
                                    color: DoctorColor.white,
                                  ),
                                ),)
                            ],
                          ),
                          SizedBox(height: height/56,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/36),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name[index],
                                  style: ibold.copyWith(fontSize: 14),
                                ),
                                SizedBox(height: height/96,),
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
                                      "123 Oak Street, CA 98765".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/96,),
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
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "(58 Reviews)".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/120,),
                                const Divider(),
                                SizedBox(height: height/120,),
                                Row(
                                  children: [
                                    Image.asset(
                                      DoctorPngimage.routing,
                                      height: height / 46,
                                      color: themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "2.5 km/40min".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      DoctorPngimage.hospital,
                                      height: height / 46,
                                      color: themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "Hospital".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width / 36,
                    );
                  },
                ),
              ))
        ],
      )
    );
  }
}
