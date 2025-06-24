import 'package:doctorappointment/doctor_pages/doctor_home/doctor_book_appointment.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ApiService/ApiService.dart';
import 'FullScreenImageViewer.dart';

class SubPartnerDetails extends StatefulWidget {
  final String title; // Declare the parameter

  const SubPartnerDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<SubPartnerDetails> createState() => _SubPartnerDetailsState();
}

class _SubPartnerDetailsState extends State<SubPartnerDetails> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  final controller = Get.put(SubPartnerDetailsController());

  @override
  void initState() {
    super.initState();
    // Replace '1' with actual user ID
    controller.fetchSubPartners('1');
  }

  List<Map<String, String>> reviewList = [
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text(widget.title.tr,style: isemibold.copyWith(fontSize: 20,color: themedata.isdark?DoctorColor.white:DoctorColor.black),),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: width/36),
        //     child: Image.asset(
        //       DoctorPngimage.unlike,
        //       height: height / 46,
        //       color: themedata.isdark?DoctorColor.white:DoctorColor.black,
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: themedata.isdark?DoctorColor.lightblack:DoctorColor.white,
                  borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 5.0,
                      spreadRadius: 3,
                      offset: Offset(1, 1)
                    ),]
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/80),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(DoctorPngimage.up1,height: height/7,width: height/7,fit: BoxFit.fill,),
                          ),
                          SizedBox(width: width/36,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width/2.35,
                                child: Text(
                                  "E-Bike Service".tr,
                                  style: ibold.copyWith(fontSize: 16),
                                ),
                              ),

                              SizedBox(height: height/96,),
                              Container(
                                  height: height / 500,
                                  width: width / 2,
                                  color: DoctorColor.bgcolor),
                              SizedBox(height: height/96,),
                              Row(
                                children: [
                                  Image.asset(DoctorPngimage.icCall , height: 15, width: 15,) ,
                                  SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap: () async {
                                      final Uri dialUri = Uri(scheme: 'tel', path: '9962554825');
                                      if (await canLaunchUrl(dialUri)) {
                                        await launchUrl(dialUri);
                                      } else {
                                        Get.snackbar("Error", "Could not open dialer");
                                      }
                                    },
                                    child: Text(
                                      "9962554825".tr,
                                      style: isemibold.copyWith(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: height/96,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Container(
                                    width: width / 1.9,
                                    child: Text(
                                      "Shivaji Nagar, Jodhpur, Rajasthan 342001, India".tr,
                                      style: iregular.copyWith(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(height: 0.6, color: Colors.black54,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Image.asset(DoctorPngimage.iconsp , height: 30, width: 30,),
                                SizedBox(width: 10,),
                                Text("Sub-Partner" , style: imedium.copyWith(fontSize: 14),)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(height: 15, width: 15, decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.green
                              ),),
                              SizedBox(width: 10,),
                              Text("Active" , style: iregular.copyWith(fontSize: 16),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: height/36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.user2,
                          height: height / 30,
                          color: DoctorColor.primary,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("2,000+".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("Engineers".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.medal,
                          height: height / 30,
                          color: DoctorColor.primary,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("10+".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("Experience".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.starfill,
                          height: height / 30,
                          color: DoctorColor.primary,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("5".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("Rating".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: DoctorColor.bgcolor,
                        radius: 28,
                        child: Image.asset(
                          DoctorPngimage.messages,
                          height: height / 30,
                          color: DoctorColor.primary,
                        ),
                      ),
                      SizedBox(height: height/96,),
                      Text("1,872".tr,style: isemibold.copyWith(fontSize: 14),),
                      Text("Reviews".tr,style: iregular.copyWith(fontSize: 14),),
                    ],
                  )
                ],
              ),
              SizedBox(height: height/36,),
              Text("About me".tr,style: isemibold.copyWith(fontSize: 20,),),
              SizedBox(height: height/56,),
              Text("Mr. Dhaval Gangani is a highly skilled Mechanical Engineer specializing in machine design, thermal systems, and industrial automation....view more".tr,style: iregular.copyWith(fontSize: 14,),),
              SizedBox(height: height/36,),
              Text("Working_Time".tr,style: isemibold.copyWith(fontSize: 20,),),
              SizedBox(height: height/56,),
              Text("Monday-Friday, 08.00 AM-18.00 pM".tr,style: iregular.copyWith(fontSize: 14,),),
              SizedBox(
                height: height / 36,
              ),
              Text("Kyc".tr,style: isemibold.copyWith(fontSize: 20,),),
              SizedBox(height: height/56,),
              Text("Aadhar Card".tr,style: iregular.copyWith(fontSize: 16,),),
              SizedBox(height: height/56,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => FullScreenImageViewer(
                        imagePath: 'assets/assetN/AadharcardDummy.png', // or from network
                        tag: 'aadhar_front',
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        // height: height / 3,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: DoctorColor.bgcolor,
                          border: Border.all(color: DoctorColor.border, width: 0.7),
                        ),
                        child: Center(
                          child: Hero(
                            tag: 'aadhar_front',
                            child: Image.asset("assets/assetN/AadharcardDummy.png" , fit: BoxFit.fitWidth,)
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => FullScreenImageViewer(
                        imagePath: 'assets/images/aadhar_front.jpg', // or from network
                        tag: 'aadhar_front2',
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: DoctorColor.bgcolor,
                          border: Border.all(color: DoctorColor.border, width: 0.7),
                        ),
                        child: Center(
                          child: Hero(
                              tag: 'aadhar_front2',
                              child: Image.asset("assets/assetN/AadharcardDummy.png" , fit: BoxFit.fitWidth,)
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 70,
              ),
              Text("Pan Card".tr,style: iregular.copyWith(fontSize: 16,),),
              SizedBox(height: height/56,),
              GestureDetector(
                onTap: () {
                  Get.to(() => FullScreenImageViewer(
                    imagePath: 'assets/assetN/PanCardDummy.png', // or from network
                    tag: 'aadhar_front3',
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: width / 2.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: DoctorColor.bgcolor,
                      border: Border.all(color: DoctorColor.border, width: 0.7),
                    ),
                    child: Center(
                      child: Hero(
                          tag: 'aadhar_front3',
                          child: Image.asset("assets/assetN/PanCardDummy.png" , fit: BoxFit.fitWidth,)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 70,
              ),
              Visibility(
                visible: widget.title == "Total Sub-Partners",
                child: Column(
                  children: [
                    Text("Business certificate".tr,style: iregular.copyWith(fontSize: 16,),),
                    SizedBox(height: height/56,),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => FullScreenImageViewer(
                          imagePath: 'assets/assetN/BusinessDummy.png', // or from network
                          tag: 'aadhar_front3',
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: DoctorColor.bgcolor,
                            border: Border.all(color: DoctorColor.border, width: 0.7),
                          ),
                          child: Center(
                            child: Hero(
                                tag: 'aadhar_front3',
                                child: Image.asset("assets/assetN/BusinessDummy.png" , fit: BoxFit.fitWidth,)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: height / 36,
              ),
              Row(
                children: [
                  Text(
                    "Reviews".tr,
                    style: isemibold.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    "See_All".tr,
                    style: imedium.copyWith(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              ListView.separated(
                physics: ScrollPhysics(),
                itemCount: reviewList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(reviewList[index]['image']!),
                            ),
                            SizedBox(width: width/36,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reviewList[index]['name']!,
                                  style: ibold.copyWith(fontSize: 16),
                                ),
                                SizedBox(height: height/120,),
                                Row(
                                  children: [
                                    Text(
                                      reviewList[index]['rating']!,
                                      style: isemibold.copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: width / 46,
                                    ),
                                    Image.asset(
                                      DoctorPngimage.star5,
                                      height: height / 56,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: height/56,),
                        SizedBox(
                          width: width/1.08,
                          child: Text(
                            reviewList[index]['review']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: iregular.copyWith(fontSize: 14),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width/36,);
                  },
                  ),
              SizedBox(
                height: height / 36,
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: InkWell(
          splashColor: DoctorColor.transparent,
          highlightColor: DoctorColor.transparent,
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const DoctorBookAppointment();
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
                child: Text("Book_Appointment".tr,
                    style: imedium.copyWith(
                        fontSize: 16, color: DoctorColor.white)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubPartnerDetailsController extends GetxController {
  var isLoading = false.obs;
  var subPartners = [].obs;

  Future<void> fetchSubPartners(String userId) async {
    isLoading.value = true;

    final response = await ApiService.SubPartnerDetails({
      "user_id": userId,
    });

    isLoading.value = false;

    if (response != null && response is Map && response['statusCode'] == 200) {
      subPartners.value = response['data'];
    } else if (response != null && response.containsKey('message')) {
      Get.snackbar("Error", response['message']);
    } else {
      Get.snackbar("Error", "Failed to fetch sub partners");
    }
  }
}


