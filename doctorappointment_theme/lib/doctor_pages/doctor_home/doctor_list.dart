import 'package:doctorappointment/doctor_pages/doctor_home/doctor_details.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  int serviceselected = 0;

  List category = ["All","General","Cardiologist","Dentist","Neurology"];

  List name = ["Dr. Samaresh Srivastava","Dr. Lajja Shastri","Dr. Abhay R. Vasavada","Dr. Viraj Vasavada"];
  List profession = ["Ophthalmology","Anaesthesiology","Orthopedic Surgery","Ophthalmology"];
  List rating = ["5","4.9","4.7","5"];
  List review = ["1,872 Reviews","127 Reviews","5,223 Reviews","405 Reviews"];
  List img = [
    DoctorPngimage.d1,
    DoctorPngimage.d2,
    DoctorPngimage.d3,
    DoctorPngimage.d4,
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text("All_Doctors".tr,style: isemibold.copyWith(fontSize: 20,color: themedata.isdark?DoctorColor.white:DoctorColor.black),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Search doctor...'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
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
                        borderSide:
                        const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              SizedBox(
                height: height / 20,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
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
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: serviceselected == index ? DoctorColor.transparent : themedata.isdark ? DoctorColor.white : DoctorColor.black),
                              color: serviceselected == index
                                  ? DoctorColor.primary
                                  : DoctorColor.transparent),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 20),
                            child: Center(
                              child: Text(
                                category[index],
                                style: isemibold.copyWith(
                                    fontSize: 14,
                                    color: serviceselected == index
                                        ? DoctorColor.white
                                        : themedata.isdark ? DoctorColor.white : DoctorColor.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width / 36,
                      );
                    },
                    itemCount: category.length),
              ),
              SizedBox(height: height/36,),
              Row(
                children: [
                  Text(
                    "532 founds".tr,
                    style: ibold.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    "Default".tr,
                    style: imedium.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  ),
                  SizedBox(width: width/96,),
                  Icon(Icons.swap_vert_rounded,size: height/36,color: DoctorColor.textgrey)
                ],
              ),
              SizedBox(height: height/36,),
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
                                      Image.asset(
                                        DoctorPngimage.unlike,
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
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                        "| ${review[index]}".tr,
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
    );
  }
}
