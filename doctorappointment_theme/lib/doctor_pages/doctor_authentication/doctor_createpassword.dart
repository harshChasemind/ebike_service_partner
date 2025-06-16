import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:get/get.dart';

class DoctorCreatepassword extends StatefulWidget {
  const DoctorCreatepassword({Key? key}) : super(key: key);

  @override
  State<DoctorCreatepassword> createState() => _DoctorCreatepasswordState();
}

class _DoctorCreatepasswordState extends State<DoctorCreatepassword> {
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Column(
          children: [
            Center(child: Image.asset(DoctorPngimage.logo,height: height/8,color: DoctorColor.primary,)),
            SizedBox(height: height/36,),
            Text("Create_new_password".tr,style: isemibold.copyWith(fontSize: 20),),
            SizedBox(height: height/96,),
            Text("Your new password must be different form previously used password".tr,textAlign: TextAlign.center,style: iregular.copyWith(fontSize: 14),),
            SizedBox(height: height/26,),
            TextFormField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                decoration: InputDecoration(
                  hintText: 'Password'.tr,
                  fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(DoctorPngimage.lock,height: height/36,),
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
                  hintText: 'Confirm_Password'.tr,
                  fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(DoctorPngimage.lock,height: height/36,),
                  ),
                  hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: DoctorColor.border)),
                )),
            SizedBox(height: height/26,),
            InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {
               /* Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DoctorVerifyotp();
                  },
                ));*/
              },
              child: Container(
                height: height / 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: DoctorColor.primary),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/22),
                  child: Center(
                    child: Text("Reset_Password".tr,
                        style: imedium.copyWith(
                            fontSize: 16, color: DoctorColor.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
