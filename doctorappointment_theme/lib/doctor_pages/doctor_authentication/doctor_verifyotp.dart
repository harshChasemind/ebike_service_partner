import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../doctor_home/doctor_dashboard.dart';

class DoctorVerifyotp extends StatefulWidget {
  const DoctorVerifyotp({Key? key}) : super(key: key);

  @override
  State<DoctorVerifyotp> createState() => _DoctorVerifyotpState();
}

class _DoctorVerifyotpState extends State<DoctorVerifyotp> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
        child: Column(
          children: [
            Center(child: Image.asset(DoctorPngimage.logo,height: height/8,color: DoctorColor.primary,)),
            SizedBox(height: height/36,),
            Text("Verify_Code".tr,style: isemibold.copyWith(fontSize: 20),),
            SizedBox(height: height/96,),
            Text("Enter the the code we just sent you on your registered Email".tr,textAlign: TextAlign.center,style: iregular.copyWith(fontSize: 14),).paddingSymmetric(horizontal: 40),
            SizedBox(height: height/26,),
            Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height / 15,
                      width: height / 15,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1) {},
                          decoration: InputDecoration(
                            fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                            filled: true,
                            hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: DoctorColor.border)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: DoctorColor.border)),
                          ),
                        style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 15,
                      width: height / 15,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin2) {},
                        decoration: InputDecoration(
                          fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                          filled: true,
                          hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                        ),
                        style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 15,
                      width: height / 15,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin3) {},
                        decoration: InputDecoration(
                          fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                          filled: true,
                          hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                        ),
                        style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height / 15,
                      width: height / 15,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin4) {},
                        decoration: InputDecoration(
                          fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                          filled: true,
                          hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                        ),
                        style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    /*SizedBox(
                      height: height / 15,
                      width: height / 15,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin5) {},
                        decoration: InputDecoration(
                          fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                          filled: true,
                          hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border)),
                        ),
                        style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),*/

                  ],
                )).paddingSymmetric(horizontal: 20),
            SizedBox(height: height/26,),
            InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorDashboard("0");
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
                    child: Text("Verify".tr,
                        style: imedium.copyWith(
                            fontSize: 16, color: DoctorColor.white)),
                  ),
                ),
              ),
            ),
            SizedBox(height: height/36,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didnt_get_the_Code".tr,
                  style: iregular.copyWith(fontSize: 14),
                ),
                SizedBox(
                  width: width / 96,
                ),
                InkWell(
                    splashColor: DoctorColor.transparent,
                    highlightColor: DoctorColor.transparent,
                    onTap: () {
                      /*Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DoctorSignup();
                        },
                      ));*/
                    },
                    child: Text(
                      "Resend".tr,
                      style: imedium.copyWith(
                          fontSize: 14, color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
