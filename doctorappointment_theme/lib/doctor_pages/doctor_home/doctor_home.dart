import 'dart:io';

import 'package:doctorappointment/UserListScreens/SubpartnersList.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_list.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

import '../../ApiService/ApiService.dart';
import '../../UserListScreens/Freelancers.dart';
import '../../UserListScreens/ShopOwners.dart';
import '../doctor_profile/doctor_notification.dart';
import '../doctor_profile/ebikewallet.dart';
import 'doctor_details.dart';
import 'add_sub_partner.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  var pageController = PageController();
  var selectedIndex = 0;
  final profileController = Get.put(DoctorHomeController());
  List img = [
    DoctorPngimage.c,
    DoctorPngimage.c2,
    DoctorPngimage.c3,
    DoctorPngimage.c4,
    // DoctorPngimage.c5,
    // DoctorPngimage.c6,
    // DoctorPngimage.c7,
    // DoctorPngimage.c8,
  ];

  List category = [
    "Total Sub -Partners",
    "Shop Owners",
    "Freelancers",
    "Wallet Balance",
    // "Neurology",
    // "Gastroen..",
    // "Laborato..",
    // "Vaccinat.."
  ];

  List img2 = [
    DoctorPngimage.m1,
    DoctorPngimage.m2,
    DoctorPngimage.m1,
    DoctorPngimage.m2,
  ];

  List name = ["Sunrise Health Clinic","Golden Cardiology Center","Sunrise Health Clinic","Golden Cardiology Center"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor : Colors.white,
      appBar: AppBar(
        surfaceTintColor:
        themedata.isdark ? DoctorColor.black : DoctorColor.white,
        leadingWidth: width / 1,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Location".tr,
                    style: iregular.copyWith(fontSize: 14,color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        DoctorPngimage.locationfill,
                        height: height / 46,
                        color: themedata.isdark
                            ? DoctorColor.white
                            : DoctorColor.black,
                      ),
                      SizedBox(
                        width: width / 46,
                      ),
                      Obx(() {
                        final location =
                            profileController.profileData['city'] ?? 'Jaipur';
                        return Text(
                          location.toString(),
                          style: isemibold.copyWith(fontSize: 14),
                        );
                      }),
                      SizedBox(
                        width: width / 56,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: height / 46,
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const DoctorNotification();
                    },
                  ));
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: DoctorColor.bgcolor,
                      radius: 22,
                      child: Image.asset(
                        DoctorPngimage.notification,
                        height: height / 30,
                        color: DoctorColor.primary,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle
                        ),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              TextFormField(
                /*readOnly: true,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const DoctorList();
                    },));
                  },*/
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(
                      fontSize: 14, color: DoctorColor.black),
                  decoration: InputDecoration(
                    hintText: 'Search...'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        DoctorPngimage.search,
                        height: height / 36,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Image.asset(
                        DoctorPngimage.filter, // Replace with your filter image asset
                        height: height / 36,
                      ),
                      onPressed: () {
                        // TODO: Open filter bottom sheet, dialog, or navigate
                      },
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
              SizedBox(
                height: height / 36,
              ),
              // StatefulBuilder(
              //   builder: (context, setState) {
              //     return InkWell(
              //       child: Stack(
              //         children: [
              //           Container(
              //             height: height / 4,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               //color: themedata.isdark?Colors.white10:DoctorColor.bgcolor
              //             ),
              //             child: PageView.builder(
              //               controller: pageController,
              //               onPageChanged: (index) {
              //                 selectedIndex = index;
              //                 setState(() {});
              //               },
              //               itemCount: 4,
              //               itemBuilder: (context, index) {
              //                 return Padding(
              //                   padding: EdgeInsets.symmetric(
              //                       horizontal: width / 120),
              //                   child: ClipRRect(
              //                       borderRadius: BorderRadius.circular(10),
              //                       child: Image.asset(
              //                         DoctorPngimage.banner,
              //                         width: width / 1,
              //                         height: height / 3.8,
              //                         fit: BoxFit.fill,
              //                       )),
              //                 );
              //               },
              //             ),
              //           ),
              //           Positioned.fill(
              //             bottom: 10,
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               crossAxisAlignment: CrossAxisAlignment.end,
              //               children: List<Widget>.generate(
              //                   4,
              //                       (index) => Padding(
              //                     padding: EdgeInsets.symmetric(
              //                         horizontal: width / 96),
              //                     child: InkWell(
              //                       onTap: () {
              //                         pageController.animateToPage(index,
              //                             duration: const Duration(
              //                                 milliseconds: 300),
              //                             curve: Curves.easeIn);
              //                       },
              //                       child: CircleAvatar(
              //                         radius: 4,
              //                         backgroundColor: selectedIndex == index
              //                             ? DoctorColor.white
              //                             : (themedata.isdark
              //                             ? Colors.white10
              //                             : Colors.white38),
              //                       ),
              //                     ),
              //                   )),
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
              // SizedBox(
              //   height: height / 36,
              // ),
              Row(
                children: [
                  Text(
                    "Dashboard".tr,
                    style: ibold.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  // Text(
                  //   "See_All".tr,
                  //   style: imedium.copyWith(fontSize: 14),
                  // ),
                ],
              ),
              SizedBox(
                height: height / 56,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: (){
                        /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const DoctorList();
                      },));*/
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return  SubpartnerList(title: "Total Sub-Partners",);
                        },));
                      },
                      child: Container(
                        width: width / 2.5,
                        decoration: BoxDecoration(
                            color: DoctorColor.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(2, 4), // changes position of shadow
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                DoctorPngimage.c,
                                height: height / 12,
                                width: height / 12,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Total Sub-Partners",
                                style: ibold.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      )),
                  InkWell(
                    onTap: (){
                      /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const DoctorList();
                        },));*/
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return  ShopOwnersList(title: "Shop Owners",);
                      },));
                    },
                    child: Container(
                    width: width / 2.5,
                    decoration: BoxDecoration(
                        color: DoctorColor.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(2, 4), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                DoctorPngimage.c2,
                                height: height / 12,
                                width: height / 12,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Shop Owners",
                                style: ibold.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        )),
                  )

                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width / 2.5,
                    decoration: BoxDecoration(
                        color: DoctorColor.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(2, 4), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const DoctorList();
                          },));*/
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return  FreelancerList(title: "Freelancers",);
                            },));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  DoctorPngimage.c3,
                                  height: height / 16,
                                  width: height / 16,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: height / 120,
                                ),
                                Text(
                                  "Freelancers",
                                  style: ibold.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  Container(
                    width: width / 2.5,
                    decoration: BoxDecoration(
                        color: DoctorColor.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(2, 4), // changes position of shadow
                          ),
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const DoctorList();
                          },));*/
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return  Ebikewallet();
                            },));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                DoctorPngimage.c4,
                                height: height / 12,
                                width: height / 12,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                "Wallet balance",
                                style: ibold.copyWith(fontSize: 12),
                              ),
                            ],
                          )),
                    ),
                  )

                ],
              ),
              /*SizedBox(
                height: height / 36,
              ),
              Row(
                children: [
                  Text(
                    "Nearby_Medical_Centers".tr,
                    style: ibold.copyWith(fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    "See_All".tr,
                    style: imedium.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: height / 56,
              ),
              SizedBox(
                height: height/2.8,
                child: ListView.separated(
                  itemCount: img2.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: width/1.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8)),
                                child: Image.asset(img2[index],width: width/1.5,height: height/6,fit: BoxFit.fill,),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: CircleAvatar(
                                  backgroundColor: const Color(0x331F2A37),
                                  radius: 18,
                                  child: Image.asset(
                                    DoctorPngimage.unlike,
                                    height: height / 46,
                                    color: DoctorColor.white,
                                  ),
                                ),)
                            ],
                          ),
                          SizedBox(height: height/56,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width/36),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name[index],
                                  style: ibold.copyWith(fontSize: 14),
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
                                      "123 Oak Street, CA 98765".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/96,),
                                Row(
                                  children: [
                                    Text(
                                      "5.0".tr,
                                      style: isemibold.copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Image.asset(
                                      DoctorPngimage.star5,
                                      height: height / 56,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "(58 Reviews)".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/120,),
                                const Divider(),
                                SizedBox(height: height/120,),
                                Row(
                                  children: [
                                    Image.asset(
                                      DoctorPngimage.routing,
                                      height: height / 46,
                                      color: themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "2.5 km/40min".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      DoctorPngimage.hospital,
                                      height: height / 46,
                                      color: themedata.isdark
                                          ? DoctorColor.white
                                          : DoctorColor.black,
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Text(
                                      "Hospital".tr,
                                      style: iregular.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: width / 36,
                    );
                  },
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
class DoctorHomeController extends GetxController {
  var isLoading = false.obs;
  var profileData = <String, dynamic>{}.obs;
  var profileImageUrl = ''.obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async {
    isLoading.value = true;
    try {
      final response = await ApiService.callUserProfile();
      if (response != null && response['statusCode'] == 200) {
        profileData.value =
        Map<String, dynamic>.from(response['data']); // ✅ Safe casting

        final image = response['data']['profile_image'];
        final url = response['profile_url'];
        if (image != null && image != '') {
          profileImageUrl.value = url + image;
        } else {
          profileImageUrl.value = '';
        }
      } else {
        Get.snackbar("Error", response?['message'] ?? "Failed to load profile");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfileImage(
      {required BuildContext context, required File? imageprofile}) async {
    final response = await ApiService.uploadProfileImage(imageprofile!);
    if (response != null && response['status'] == true) {
      fetchProfile();
    } else {
      Get.snackbar("Error", response['message'] ?? "OTP verification failed");
    }
  }
}