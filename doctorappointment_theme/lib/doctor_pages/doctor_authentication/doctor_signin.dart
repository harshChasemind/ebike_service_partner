import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_verifyotp.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
// import 'package:doctorappointment/doctor_services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../apiservice/apiservice.dart';

class DoctorSignin extends StatefulWidget {
  String? userId;
  DoctorSignin(this.userId ,{Key? key}) : super(key: key);

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
          child: Form(
            key: controller.formKeySignIN,
            child: Column(
              children: [
                SizedBox(height: height / 24),
                Image.asset(
                  DoctorPngimage.iconEbike,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: height / 36),
                Text(
                  "Welcome to Bike Service!".tr,
                  style: isemibold.copyWith(fontSize: 20),
                ),
                SizedBox(height: height / 96),
                Text(
                  "Enter your Mobile, we will send you a verification code.".tr,
                  textAlign: TextAlign.center,
                  style: iregular.copyWith(fontSize: 14),
                ),
                SizedBox(height: height / 26),
                TextFormField(
                  controller: controller.mobileController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: controller.validateMobile,
                  // onChanged: (text){
                  //   print(controller.mobileController.text);
                  // },
                  style: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                  decoration: InputDecoration(
                    hintText: 'your_mobile_no'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                    filled: true,
                    counterText: '',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        DoctorPngimage.iconMobile,
                        height: height / 36,
                        color: DoctorColor.black,
                      ),
                    ),
                    hintStyle: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.red)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  ),
                ),
                SizedBox(height: height / 26),
                Obx(() => controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : InkWell(
                  splashColor: DoctorColor.transparent,
                  highlightColor: DoctorColor.transparent,
                  onTap: () {
                    controller.sendOtp(context);
                  },
                  child: Container(
                    height: height / 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: DoctorColor.blueBG,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 22),
                      child: Center(
                        child: Text("send_otp".tr,
                            style: imedium.copyWith(fontSize: 16, color: DoctorColor.white)),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoctorSigninController extends GetxController {
  final formKeySignIN = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  var isLoading = false.obs;

  String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  Future<void> sendOtp(BuildContext context) async {
    if (!formKeySignIN.currentState!.validate()) return;

    isLoading.value = true;
    final response = await ApiService.login(
      {"mobile_number": mobileController.text.trim()},
    );
    print("Responseeeee ${mobileController.text}");

    isLoading.value = false;
    if (response != null && response is Map && response['statusCode'] == 200) {

      // You can store the ID if needed
      String userId = response['data']['_id'];
      print("User ID: $userId");
      await Get.to(() => DoctorVerifyotp(userId: userId, mobileNumber: mobileController.text.trim(),));
      mobileController.clear();
    } else if (response != null && response is Map && response.containsKey('message')) {
      Get.snackbar("Error", response['message']);
    } else {
      Get.snackbar("Error", "Something went wrong while sending OTP");
    }
  }

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }
}