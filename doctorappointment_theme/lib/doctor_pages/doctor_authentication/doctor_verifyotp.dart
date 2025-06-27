import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../ApiService/ApiService.dart';
import '../doctor_home/doctor_dashboard.dart';
import 'doctor_signup.dart';

class DoctorVerifyotp extends StatefulWidget {
  String userId = "";
  String mobileNumber = "";
  DoctorVerifyotp({Key? key , required this.userId , required this.mobileNumber}) : super(key: key);

  @override
  State<DoctorVerifyotp> createState() => _DoctorVerifyotpState();
}

class _DoctorVerifyotpState extends State<DoctorVerifyotp> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  TextEditingController _otpController = TextEditingController();
  final controller = Get.put(DoctorVerifyOtpController());

  String _otp = "";
  String? _otpError; // 🔴 Added to show validation message

  @override
  void dispose() {
    _otpController.dispose(); // ✅ Properly dispose the controller
    super.dispose();
  }


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
        padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          children: [
            Center(child: Image.asset(DoctorPngimage.iconEbike, height: height / 8, color: DoctorColor.primary)),
            SizedBox(height: height / 36),
            Text("Verify_Code".tr, style: isemibold.copyWith(fontSize: 20)),
            SizedBox(height: height / 96),
            Text(
              "Enter the the code we just sent you on your registered Mobile No.".tr,
              textAlign: TextAlign.center,
              style: iregular.copyWith(fontSize: 14),
            ).paddingSymmetric(horizontal: 40),
            SizedBox(height: height / 26),

            // 🔽 OTP Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  PinCodeTextField(
                    cursorColor: DoctorColor.textgrey,
                    length: 4,
                    textStyle: isemibold.copyWith(
                      color: DoctorColor.textgrey,
                      fontSize: 28,
                    ),
                    obscureText: false,
                    controller: _otpController,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      fieldHeight: 55,
                      fieldWidth: 60,
                      borderRadius: BorderRadius.circular(10),
                      shape: PinCodeFieldShape.box,
                      activeFillColor: DoctorColor.bgcolor,
                      inactiveFillColor: DoctorColor.bgcolor,
                      selectedFillColor: DoctorColor.bgcolor,
                      activeColor: DoctorColor.border,
                      inactiveColor: DoctorColor.border,
                      selectedColor: DoctorColor.primary,
                    ),
                    keyboardType: TextInputType.number,
                    animationDuration: const Duration(milliseconds: 300),
                    autoFocus: false,
                    onCompleted: (v) => _otp = v,
                    onChanged: (value) {
                      setState(() {
                        _otp = value;
                        _otpError = null; // 🔁 Clear error on change
                      });
                    },
                    beforeTextPaste: (text) => true,
                    appContext: context,
                  ),

                  // 🔽 Inline Error Message Below OTP Boxes
                  if (_otpError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _otpError!,
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: height / 26),

            // 🔽 Verify Button
            InkWell(
              splashColor: DoctorColor.transparent,
              highlightColor: DoctorColor.transparent,
              onTap: () {
                String otpText = _otpController.text.trim();

                if (otpText.isEmpty) {
                  setState(() {
                    _otpError = "Please enter OTP";
                  });
                  return;
                }

                if (otpText != "1234") {
                  setState(() {
                    _otpError = "Invalid OTP";
                  });
                  return;
                }

                // ✅ If OTP is correct
                setState(() {
                  _otpError = null;
                });

                controller.verifyOtp(
                  context: context,
                  mobileNumber: widget.mobileNumber,
                  otp: otpText,
                );
              },
              child: Container(
                height: height / 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: DoctorColor.blueBG,
                ),
                padding: EdgeInsets.symmetric(horizontal: width / 22),
                child: Center(
                  child: Text(
                    "Verify Otp".tr,
                    style: imedium.copyWith(fontSize: 16, color: DoctorColor.white),
                  ),
                ),
              ),
            ),

            SizedBox(height: height / 36),

            // 🔽 Resend OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didnt_get_the_Code".tr, style: iregular.copyWith(fontSize: 14)),
                SizedBox(width: width / 96),
                InkWell(
                  splashColor: DoctorColor.transparent,
                  highlightColor: DoctorColor.transparent,
                  onTap: () {
                    if (widget.userId.isNotEmpty) {
                      controller.resendOtp(widget.userId, context);
                    } else {
                      setState(() {
                        _otpError = "User ID not available";
                      });
                    }
                  },
                  child: Text("Resend".tr,
                      style: imedium.copyWith(fontSize: 14, color: Colors.blue)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class DoctorVerifyOtpController extends GetxController{
  final formKey = GlobalKey<FormState>();
  // final otpController = TextEditingController();
  var isLoading = false.obs;
  Future<void>verifyOtp(
      {
        required BuildContext context,
        required String mobileNumber,
        required String otp,
      }) async {
    Map<String , Object> otpVerifyJson = {
      "mobile_number": mobileNumber,
      "otp": otp,
    };
    isLoading.value = true;
    final response = await ApiService.callOtpVerify(otpVerifyJson);
    isLoading.value = false;

    if (response != null && response['statusCode'] == 200) {
      String token = response['data']['token'];
      int isRegisterd = response['data']['is_registered'];
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", token);
      ApiService.token = token;
      print("token=== ${ApiService.token}");
      if(isRegisterd == 0){
        Get.to(DoctorSignup());
      }else{
        Get.to(DoctorDashboard(0));
      }
      // Get.offAll(() => DoctorDashboard()); // or any screen you want
    } else {
      Get.snackbar("Error", response['message'] ?? "OTP verification failed");
    }
  }


  // var isLoading = false.obs;

  Future<void> resendOtp(String userId, BuildContext context) async {
    isLoading.value = true;
    final response = await ApiService.resendOTP({"_id": userId});
    isLoading.value = false;

    if (response != null && response['statusCode'] == 200) {
      Get.snackbar("Success", "OTP resent successfully");
    } else if (response != null && response.containsKey('message')) {
      Get.snackbar("Error", response['message']);
    } else {
      Get.snackbar("Error", "Something went wrong while resending OTP");
    }
  }

  // Future<void> verifyOtp(String userId, String otp, BuildContext context) async {
  //   isLoading.value = true;
  //   final response = await ApiService.resendOTP({"_id": userId, "otp": otp});
  //   isLoading.value = false;
  //
  //   if (response != null && response['statusCode'] == 200) {
  //     Get.snackbar("Success", "OTP verified successfully");
  //     Get.offAll(() => DoctorDashboard(0)); // ← Make sure constructor accepts String
  //   } else {
  //     Get.snackbar("Error", response['message'] ?? "OTP verification failed");
  //   }
  // }


// @override
// void onClose() {
//   otpController.dispose();
//   super.onClose();
// }
}