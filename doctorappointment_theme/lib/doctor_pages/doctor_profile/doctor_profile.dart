import 'dart:io';

import 'package:doctorappointment/UserListScreens/SubpartnersList.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_onboarding.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/doctor_cms.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/doctor_editprofile.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/doctor_favorites.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/doctor_notification.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/doctor_report.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'doctor_patients.dart';
import 'ebikewallet.dart';
import 'mykyc.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  bool isdark = true;
  File? _pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _pickedImage = File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: DoctorColor.white,
        title: Text("Profile".tr,style: isemibold.copyWith(fontSize: 20,color: themedata.isdark?DoctorColor.white:DoctorColor.black),),
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
                      backgroundImage:  _pickedImage != null
                          ? FileImage(_pickedImage!)
                          : AssetImage(DoctorPngimage.profileimg),
                    ),
                    Positioned(
                        right: 20,
                        bottom: 5,
                        child: GestureDetector(
                          onTap: _pickImage,
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
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(height: height/46,),
              Text("Dharmendra Bachheriya".tr,style: ibold.copyWith(fontSize: 16,),),
              SizedBox(height: height/200,),
              Text("+91-8306402805".tr,style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),),
              SizedBox(height: height/36,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorEditprofile();
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.useredit,height: height/36,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/26,),
                    Text("Edit_Profile".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),
              SizedBox(height: height/120,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SubpartnerList(title: "My Sub-Partners");
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.iconsp,height: height/46,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/20,),
                    Text("My Sub-Partners".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SubpartnerList(title: "Freelancer");
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.iconSO,height: 20,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/20,),
                    Text("My Shop owners/Freelancer".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Mykyc();
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.iconKYC,height: 20,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/20,),
                    Text("My KYC".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),


              /*SizedBox(height: height/120,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorFavorites();
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.unlike,height: height/46,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/20,),
                    Text("Favorite".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),*/


              SizedBox(height: height/120,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Ebikewallet();
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.iconWallet,height: height/36,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/26,),
                    Text("Wallet".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),

              SizedBox(height: height/120,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorCms("privacy");
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.imgprivacy,height: height/32,color:themedata.isdark?DoctorColor.white:DoctorColor.black,),
                    SizedBox(width: width/26,),
                    Text("Help and Support".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),
              SizedBox(height: height/120,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DoctorCms("terms");
                    },
                  ));
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.security,height: height/36,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/26,),
                    Text("Terms_Conditions".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),
              /*SizedBox(height: height/120,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  _showbottomsheet();
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.swap,height: height/36,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/26,),
                    Text("Change_layout".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),
              SizedBox(height: height/120,),
              InkWell(
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.darkmode,height: height/36,color:themedata.isdark?DoctorColor.white:DoctorColor.black,),
                    SizedBox(width: width/26,),
                    Text("DarkMode".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    SizedBox(
                      height: height / 22,
                      width: width / 8,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          activeColor: DoctorColor.primary,
                          onChanged: (state) {
                            themedata.changeThem(state);
                            setState(() {
                              isdark = state;
                            });
                            themedata.update();
                          },
                          value: themedata.isdark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height/120,),
              const Divider(),*/
              SizedBox(height: height/120,),
              InkWell(
                splashColor: DoctorColor.transparent,
                highlightColor: DoctorColor.transparent,
                onTap: () {
                  logout();
                },
                child: Row(
                  children: [
                    Image.asset(DoctorPngimage.logout,height: height/36,color:themedata.isdark?DoctorColor.white:DoctorColor.black ,),
                    SizedBox(width: width/26,),
                    Text("Log Out".tr,style: iregular.copyWith(fontSize: 16,),),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,size: height/46,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  _showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  height: height / 4,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text('selectapplicationlayout'.tr,
                            style: isemibold.copyWith(
                              fontSize: 14,
                            )),
                      ),
                      const Divider(),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: DoctorColor.transparent,
                          splashColor: DoctorColor.transparent,
                          onTap: () async {
                            await Get.updateLocale(const Locale('en', 'US'));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ltr'.tr,
                                style: isemibold.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: DoctorColor.transparent,
                          splashColor: DoctorColor.transparent,
                          onTap: () async {
                            await Get.updateLocale(const Locale('ar', 'ab'));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'rtl'.tr,
                                style: isemibold.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: DoctorColor.transparent,
                          splashColor: DoctorColor.transparent,
                          onTap: () async {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'cancel'.tr,
                                style: isemibold.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  logout() {
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
                      "Logout".tr,
                      style: isemibold.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: height/96,),
                    const Divider(),
                    SizedBox(height: height/96,),
                    Text(
                      "Are_you_sure_you_want_to_log_out".tr,
                      style: iregular.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: height/36,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: DoctorColor.transparent,
                          highlightColor: DoctorColor.transparent,
                          onTap: () {
                            Get.back();
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
                            // Get.to(() => const DoctorSignin());
                            Get.to(() => const DoctorOnboarding());
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
                                child: Text("Yes_Logout".tr,
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
