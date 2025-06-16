import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_verifyotp.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorForgotpassword extends StatefulWidget {
  const DoctorForgotpassword({Key? key}) : super(key: key);

  @override
  State<DoctorForgotpassword> createState() => _DoctorForgotpasswordState();
}

class _DoctorForgotpasswordState extends State<DoctorForgotpassword> {
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
            Image.asset(
              DoctorPngimage.icAppLogoDark,
              fit: BoxFit.cover,
            ),
            SizedBox(height: height/36,),
            Text("Forgot_password".tr,style: isemibold.copyWith(fontSize: 20),),
            SizedBox(height: height/96,),
            Text("Enter your Email, we will send you a verification code.".tr,textAlign: TextAlign.center,style: iregular.copyWith(fontSize: 14),).paddingSymmetric(horizontal: 40),
            SizedBox(height: height/26,),
            TextFormField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                decoration: InputDecoration(
                  hintText: 'your_mobile_no'.tr,
                  fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(DoctorPngimage.icCall,height: height/36,),
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
            InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorVerifyotp();
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
                    child: Text("Send_Code".tr,
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
