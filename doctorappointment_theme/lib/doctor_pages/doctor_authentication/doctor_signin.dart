import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_forgotpassword.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_signup.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_verifyotp.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_dashboard.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorSignin extends StatefulWidget {
  const DoctorSignin({Key? key}) : super(key: key);

  @override
  State<DoctorSignin> createState() => _DoctorSigninState();
}

class _DoctorSigninState extends State<DoctorSignin> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  final controller = Get.put(DoctorSigninController());
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(height: height/24,),
                Image.asset(
                  DoctorPngimage.iconEbike,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: height/36,),
                Text("Welcome to Bike Service!".tr,style: isemibold.copyWith(fontSize: 20),),
                SizedBox(height: height/96,),
                Text("Enter your Mobile, we will send you a verification code.".tr,textAlign: TextAlign.center,style: iregular.copyWith(fontSize: 14),),
                SizedBox(height: height/26,),
                TextFormField(
                    controller: controller.mobileController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    validator: controller.validateMobile,
                    // scrollPadding: EdgeInsets.only(
                    //     bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                        hintText: 'your_mobile_no'.tr,
                        fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                        filled: true,
                        counterText: '',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(DoctorPngimage.iconMobile,height: height/36,),
                        ),
                        hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.red)),
                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border))
                    )),
                /*SizedBox(height: height/36,),
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
                    )),*/
                SizedBox(height: height/26,),
                InkWell(
                  splashColor: DoctorColor.transparent,
                  highlightColor: DoctorColor.transparent,
                  onTap: () {

                    if (controller.formKey.currentState!.validate()) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const DoctorVerifyotp(),
                      ));
                    }
                  },
                  child: Container(
                    height: height / 15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: DoctorColor.blueBG),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width/22),
                      child: Center(
                        child: Text("send_otp".tr,
                            style: imedium.copyWith(
                                fontSize: 16, color: DoctorColor.white)),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: height/26,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Container(
                //         height: height / 500,
                //         width: width / 2.85,
                //         color: DoctorColor.border),
                //     Text(
                //       "or".tr,
                //       style: imedium.copyWith(
                //           fontSize: 16, color: DoctorColor.textgrey),
                //     ),
                //     Container(
                //         height: height / 500,
                //         width: width / 2.85,
                //         color: DoctorColor.border),
                //   ],
                // ),
                // SizedBox(height: height/36,),
                // /*Container(
                //   width: width / 1,
                //   height: height / 14,
                //   decoration: BoxDecoration(
                //       border: Border.all(color:DoctorColor.border),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Image.asset(
                //         DoctorPngimage.google,
                //         height: height / 36,
                //       ),
                //       SizedBox(
                //         width: width / 26,
                //       ),
                //       Text(
                //         "Continue_with_Google".tr,
                //         style: imedium.copyWith(fontSize: 14),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: height/56,),
                // Container(
                //   width: width / 1,
                //   height: height / 14,
                //   decoration: BoxDecoration(
                //       border: Border.all(color:DoctorColor.border),
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Image.asset(
                //         DoctorPngimage.facebook,
                //         height: height / 30,
                //       ),
                //       SizedBox(
                //         width: width / 26,
                //       ),
                //       Text(
                //         "Continue_with_Facebook".tr,
                //         style: imedium.copyWith(fontSize: 14),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(height: height/36,),*/
                // InkWell(
                //     splashColor: DoctorColor.transparent,
                //     highlightColor: DoctorColor.transparent,
                //     onTap: () {
                //         Navigator.push(context, MaterialPageRoute(
                //             builder: (context) {
                //               return const DoctorForgotpassword();
                //             },
                //           ));
                //     },
                //     child: Text(
                //       "Forgot_password".tr,
                //       style: imedium.copyWith(
                //           fontSize: 14, color: Colors.blue),
                //     )),
                /*SizedBox(height: height/46,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont_have_an_account_yet".tr,
                      style: iregular.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      width: width / 96,
                    ),
                    InkWell(
                        splashColor: DoctorColor.transparent,
                        highlightColor: DoctorColor.transparent,
                        onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const DoctorSignup();
                            },
                          ));
                        },
                        child: Text(
                          "Sign_up".tr,
                          style: imedium.copyWith(
                              fontSize: 14, color: Colors.blue),
                        )),
                  ],
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class DoctorSigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }
}
