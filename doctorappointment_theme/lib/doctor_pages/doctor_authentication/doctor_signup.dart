import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_fillprofile.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_signin.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_dashboard.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorSignup extends StatefulWidget {
  const DoctorSignup({Key? key}) : super(key: key);

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}

class _DoctorSignupState extends State<DoctorSignup> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());

// Define at the top of _DoctorSignupState
  String? selectedType;
  String? selectedGender;

  List<String> types = ['Partner', 'Sub-Partner'];
  List<String> genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorSignupController());
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
                Text("Create_Account".tr,style: isemibold.copyWith(fontSize: 20),),
                SizedBox(height: height/96,),
                Text("We_are_here_to_help_you".tr,style: iregular.copyWith(fontSize: 14),),
                SizedBox(height: height/26,),
                TextFormField(
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Your_Name'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.user,height: height/36,),
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
                    controller: controller.emailController,
                    validator: controller.validateEmail,
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Your_Email'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.email,height: height/36,),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: DoctorColor.border))
                    )),
                SizedBox(height: height/36,),
            
            
                // Select Type Dropdown
                Container(
                  decoration: BoxDecoration(
                    color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.bgcolor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: DoctorColor.border),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: Text(
                      'Select Type',
                      style: iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
                    ),
                    value: selectedType,
                    items: types.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type, style: iregular.copyWith(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedType = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: height/36,),
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
                        child: Image.asset(DoctorPngimage.iconMobile,height: height/36,),
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
            
                // Gender Dropdown
            
                Container(
                  decoration: BoxDecoration(
                    color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.bgcolor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: DoctorColor.border),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    hint: Text(
                      'Select Gender',
                      style: iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
                    ),
                    value: selectedGender,
                    items: genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender, style: iregular.copyWith(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                ),
                // TextFormField(
                //     scrollPadding: EdgeInsets.only(
                //         bottom: MediaQuery.of(context).viewInsets.bottom),
                //     style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                //     decoration: InputDecoration(
                //       hintText: 'Business Name'.tr,
                //       fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                //       filled: true,
                //       prefixIcon: Padding(
                //         padding: const EdgeInsets.all(15),
                //         child: Image.asset(DoctorPngimage.iconBusiness,height: height/36,color: DoctorColor.textgrey),
                //       ),
                //       hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                //       enabledBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide: const BorderSide(color: DoctorColor.border)),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide: const BorderSide(color: DoctorColor.border)),
                //     )),
                SizedBox(height: height/36,),
                TextFormField(
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                    decoration: InputDecoration(
                      hintText: 'Address'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.iconBuilding,height: height/36,color: DoctorColor.textgrey),
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
                      hintText: 'City'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.iconBuilding,height: height/36,color: DoctorColor.textgrey),
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
                      hintText: 'State'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.iconBuilding,height: height/36,color: DoctorColor.textgrey),
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
                      hintText: 'Pincode'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.iconBuilding,height: height/36,color: DoctorColor.textgrey),
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
                    if (controller.formKey.currentState!.validate()) {
                      // If valid, go to next screen
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DoctorDashboard("0");
                        },
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
                        child: Text("Create_Account".tr,
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Do_you_have_anaccount".tr,
                //       style: iregular.copyWith(fontSize: 14),
                //     ),
                //     SizedBox(
                //       width: width / 96,
                //     ),
                //     InkWell(
                //         splashColor: DoctorColor.transparent,
                //         highlightColor: DoctorColor.transparent,
                //         onTap: () {
                //           Navigator.push(context, MaterialPageRoute(
                //             builder: (context) {
                //               return const DoctorSignin();
                //             },
                //           ));
                //         },
                //         child: Text(
                //           "Sign_In".tr,
                //           style: imedium.copyWith(
                //               fontSize: 14, color: Colors.blue),
                //         )),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class DoctorSignupController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      // Do something with the valid email
      print('Valid email: ${emailController.text}');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
