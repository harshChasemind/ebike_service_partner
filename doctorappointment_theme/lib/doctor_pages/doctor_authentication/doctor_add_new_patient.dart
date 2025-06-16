import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:get/get.dart';

class DoctorAddNewPatient extends StatefulWidget {
  const DoctorAddNewPatient({Key? key}) : super(key: key);

  @override
  State<DoctorAddNewPatient> createState() => _DoctorAddNewPatientState();
}

class _DoctorAddNewPatientState extends State<DoctorAddNewPatient> {
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
        title: Text("Added New Paitents".tr,style: isemibold.copyWith(fontSize: 20),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: DoctorColor.transparent,
                      backgroundImage: AssetImage(DoctorPngimage.placeorder),
                    ),
                    Positioned(
                      right: 0,
                        bottom: 0,
                        child: Container(
                      height: height/26,
                      width: height/26,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
                        color: themedata.isdark?DoctorColor.white :DoctorColor.black
                      ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(DoctorPngimage.edit,height: height/46,color: themedata.isdark?DoctorColor.black :DoctorColor.white),
                          ),
                    ))
                  ],
                ),
              ),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Your_Name'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Nickname'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'name@example.com'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Date_of_Birth'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(DoctorPngimage.calendar,height: height/36,),
                    ),
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  decoration: InputDecoration(
                    hintText: 'Gender'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,size: height/36,color: DoctorColor.textgrey),
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              TextFormField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Description'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  )),
              SizedBox(height: height/36,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  //signupsuccess();
                },
                child: Container(
                  height: height / 15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: DoctorColor.primary),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/22),
                    child: Center(
                      child: Text("Save".tr,
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

  signupsuccess() async {
    return await showDialog(
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height/36),
              child: Column(
                children: [
                  Image.asset(DoctorPngimage.success,height: height/7,),
                  SizedBox(height: height/26,),
                  Text("Congratulations!".tr,
                      style: imedium.copyWith(
                          fontSize: 20,)),
                  SizedBox(height: height/96,),
                  Text("Your account is ready to use. You will be redirected to the Home Page in a few seconds...".tr,
                      textAlign: TextAlign.center,
                      style: iregular.copyWith(
                        fontSize: 14,color: DoctorColor.grey)),
                  SizedBox(height: height/26,),
                  Image.asset(DoctorPngimage.loader,height: height/15,),

                ],
              ),
            )
          ],
        ),
        context: context);
  }

}
