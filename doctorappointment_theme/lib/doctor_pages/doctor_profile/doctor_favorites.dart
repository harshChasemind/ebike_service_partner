import 'package:doctorappointment/doctor_pages/doctor_home/doctor_details.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

class DoctorFavorites extends StatefulWidget {
  const DoctorFavorites({Key? key}) : super(key: key);

  @override
  State<DoctorFavorites> createState() => _DoctorFavoritesState();
}

class _DoctorFavoritesState extends State<DoctorFavorites> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  List name = ["Dr. Samaresh Srivastav","Dr. Vaishali Vasavada","Dr. Shail Vasavada","Dr. Deepa Agrawal","Dr. Harsha Tripathi"];
  List profession = ["Ophthalmology","Anaesthesiology","Ophthalmology","Anaesthesiology","Ophthalmology"];
  List rating = ["5","4.9","4.7","5","4.9"];
  List review = ["1,872 Reviews","127 Reviews","5,223 Reviews","405 Reviews","523 Reviews"];
  List img = [
    DoctorPngimage.d1,
    DoctorPngimage.d2,
    DoctorPngimage.d3,
    DoctorPngimage.d4,
    DoctorPngimage.d6,
  ];

  List img2 = [
    DoctorPngimage.m1,
    DoctorPngimage.m2,
    DoctorPngimage.m1,
    DoctorPngimage.m2,
  ];

  List name2 = ["Sunrise Health Clinic","Golden Cardiology Center","Sunrise Health Clinic","Golden Cardiology Center"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: DoctorColor.white,
          title: Text("Favorites".tr,style: isemibold.copyWith(fontSize: 20,color: themedata.isdark?DoctorColor.white:DoctorColor.black),),
          /*bottom: TabBar(
              unselectedLabelStyle: isemibold.copyWith(
                color: DoctorColor.grey,
                fontSize: 16,
              ),
              labelStyle: isemibold.copyWith(
                  fontSize: 16,
                  color: themedata.isdark
                      ? DoctorColor.white
                      : DoctorColor.black),
              indicatorColor: themedata.isdark
                  ? DoctorColor.white
                  : DoctorColor.black,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  child: Text(
                    "Doctors".tr,
                  ),
                ),
                Tab(
                  child: Text(
                    "Hospitals".tr,
                  ),
                ),
              ]),*/
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const DoctorDetails();
                            },));
                          },
                          child: Container(
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
                                    child: Image.asset(img[index],height: height/6.5,width: height/6.5,fit: BoxFit.fill,),
                                  ),
                                  SizedBox(width: width/36,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width/2.35,
                                            child: Text(
                                              name[index],
                                              style: ibold.copyWith(fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(width: width/56,),
                                          InkWell(
                                            splashColor: DoctorColor.transparent,
                                            highlightColor: DoctorColor.transparent,
                                            onTap:() {
                                              _showbottomsheet();
                                            },
                                            child: Image.asset(
                                              DoctorPngimage.like,
                                              height: height / 46,
                                              color: themedata.isdark
                                                  ? DoctorColor.white
                                                  : DoctorColor.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height/96,),
                                      Container(
                                          height: height / 500,
                                          width: width / 2,
                                          color: DoctorColor.bgcolor),
                                      SizedBox(height: height/96,),
                                      Text(
                                        profession[index],
                                        style: isemibold.copyWith(fontSize: 14),
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
                                            "Tilak Nagar, Jaipur".tr,
                                            style: iregular.copyWith(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height/96,),
                                      Row(
                                        children: [
                                          Image.asset(
                                            DoctorPngimage.star,
                                            height: height / 56,
                                          ),
                                          SizedBox(
                                            width: width / 46,
                                          ),
                                          Text(
                                            rating[index],
                                            style: iregular.copyWith(fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: width / 46,
                                          ),
                                          Text(
                                            "| ${review[index]}",
                                            style: iregular.copyWith(fontSize: 12),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height/56,);
                      },
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
                child: Column(
                  children: [
                    ListView.separated(
                      itemCount: img2.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
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
                                    child: Image.asset(img2[index],width: width/1,height: height/6,fit: BoxFit.fill,),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0x331F2A37),
                                      radius: 18,
                                      child: Image.asset(
                                        DoctorPngimage.like,
                                        height: height / 46,
                                        color: DoctorColor.white,
                                      ),
                                    ),)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/56),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name2[index],
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
                          height: height / 36,
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _showbottomsheet() {
    showModalBottomSheet(
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
                      "Remove from Favorites?".tr,
                      style: isemibold.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: height/96,),
                    const Divider(),
                    SizedBox(height: height/96,),
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
                              child: Image.asset(DoctorPngimage.d1,height: height/6.5,width: height/6.5,fit: BoxFit.fill,),
                            ),
                            SizedBox(width: width/36,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width/2.35,
                                      child: Text(
                                        "Dr. David Patel",
                                        style: ibold.copyWith(fontSize: 16),
                                      ),
                                    ),
                                    SizedBox(width: width/56,),
                                    Image.asset(
                                      DoctorPngimage.like,
                                      height: height / 46,
                                      color: themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/96,),
                                Container(
                                    height: height / 500,
                                    width: width / 2,
                                    color: DoctorColor.bgcolor),
                                SizedBox(height: height/96,),
                                Text(
                                  "Cardiologist".tr,
                                  style: isemibold.copyWith(fontSize: 14),
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
                                      "Cardiology Center, USA".tr,
                                      style: iregular.copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/96,),
                                Row(
                                  children: [
                                    Image.asset(
                                      DoctorPngimage.star,
                                      height: height / 56,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "5".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "| 1,872 Reviews".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),

                                  ],
                                ),
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
                        InkWell(
                          splashColor: DoctorColor.transparent,
                          highlightColor: DoctorColor.transparent,
                          onTap: () {
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
                                child: Text("Yes_Remove".tr,
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

}
