import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ApiService/ApiService.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_book_appointment.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
// import 'FullScreenImageViewer.dart';

class ShopOwnerDetails extends StatefulWidget {
  final String userId; // Add userId parameter

  const ShopOwnerDetails({
    Key? key,
    required this.userId, // Make it required
  }) : super(key: key);

  @override
  State<ShopOwnerDetails> createState() => _ShopOwnerDetailsState();
}

class _ShopOwnerDetailsState extends State<ShopOwnerDetails> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  final controller = Get.put(ShopOwnerDetailsController());

  @override
  void initState() {
    super.initState();
    controller.callShopOwnerDetail(widget.userId); // Use passed userId
  }

  List<Map<String, String>> reviewList = [
    {
      'image': 'assets/images/user1.jpg',
      'name': 'John Doe',
      'rating': '5',
      'review': 'Excellent service! Highly recommended.'
    },
    {
      'image': 'assets/images/user2.jpg',
      'name': 'Jane Smith',
      'rating': '4',
      'review': 'Good experience overall.'
    },
  ];

  Widget _buildStatCircle({required String icon, required String value, required String label}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: DoctorColor.bgcolor,
          radius: 28,
          child: Image.asset(
            icon,
            height: height / 30,
            color: DoctorColor.primary,
          ),
        ),
        SizedBox(height: height/96),
        Text(value.tr, style: isemibold.copyWith(fontSize: 14)),
        Container(
            width: width / 5 ,child: Text(label.tr,textAlign: TextAlign.center, style: iregular.copyWith(fontSize: 14))),
      ],
    );
  }

  Widget _buildDocumentImage({String? imageUrl, required String placeholder, required String tag}) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => FullScreenImageViewer(
        //   imagePath: imageUrl ?? placeholder,
        //   tag: tag,
        // ));
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
                tag: tag,
                child: imageUrl != null
                    ? CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fitWidth)
                    : Image.asset(placeholder, fit: BoxFit.fitWidth)
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewsList() {
    // final displayReviews = reviews ?? reviewList;
    var partnerReview = controller.subPartnerDetailsReviews.value;
    print("Review $partnerReview");

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemCount: partnerReview.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final review = partnerReview;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: (review[index]['profile_image'] != null && review[index]['profile_image'].toString().isNotEmpty)
                        ? ApiService.imageurl + review[index]['profile_image']
                        : '',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(strokeWidth: 2),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/user1.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: width/36),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review[index]['name'] ?? 'Unknown User',
                      style: ibold.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: height/120),
                    Row(
                      children: [
                        Text(
                          review[index]['rating']?.toString() ?? '5',
                          style: isemibold.copyWith(fontSize: 12),
                        ),
                        SizedBox(width: width / 60),
                        RatingBarIndicator(
                          rating: double.tryParse(review[index]['rating'].toString()) ?? 0,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: height / 56,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: height/56),
            // SizedBox(
            //   width: width/1.08,
            //   child: Text(
            //     review['review'] ?? 'No review text provided',
            //     maxLines: 2,
            //     overflow: TextOverflow.ellipsis,
            //     style: iregular.copyWith(fontSize: 14),
            //   ),
            // ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: height/36);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text(
          "Shop Owner Details",
          style: isemibold.copyWith(
              fontSize: 20,
              color: themedata.isdark ? DoctorColor.white : DoctorColor.black
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final partner = controller.subPartnerDetails.value;
        final partnerStat = controller.subPartnerDetailsStatics.value;
        final partnerReview = controller.subPartnerDetailsReviews.value;
        print("Review $partnerReview");
        if (partner.isEmpty) {
          return Center(child: Text("No partner details found"));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36, vertical: height/36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Partner Info Card
                Container(
                  decoration: BoxDecoration(
                      color: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(
                          color: Colors.grey.shade100,
                          blurRadius: 5.0,
                          spreadRadius: 3,
                          offset: Offset(1, 1)
                      )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/36, vertical: height/80),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: partner['profile_image'] != null
                                  ? Image.network(
                                ApiService.imageurl+partner['profile_image'],
                                height: height/7,
                                width: height/7,
                                fit: BoxFit.fill,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    DoctorPngimage.up1,
                                    height: height/7,
                                    width: height/7,
                                    fit: BoxFit.fill,
                                  );
                                },
                              )
                                  : Image.asset(
                                DoctorPngimage.up1,
                                height: height/7,
                                width: height/7,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: width/36),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: width/2.35,
                                  child: Text(
                                    partner['name'] ?? "E-Bike Service".tr,
                                    style: ibold.copyWith(fontSize: 16),
                                  ),
                                ),
                                SizedBox(height: height/96),
                                Container(
                                    height: height / 500,
                                    width: width / 2,
                                    color: DoctorColor.bgcolor),
                                SizedBox(height: height/96),
                                Row(
                                  children: [
                                    Image.asset(DoctorPngimage.icCall, height: 15, width: 15),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () async {
                                        final phone = partner['mobile_number'];
                                        final Uri dialUri = Uri(scheme: 'tel', path: phone);
                                        if (await canLaunchUrl(dialUri)) {
                                          await launchUrl(dialUri);
                                        } else {
                                          Get.snackbar("Error", "Could not open dialer");
                                        }
                                      },
                                      child: Text(
                                        partner['mobile_number'],
                                        style: isemibold.copyWith(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height/96),
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
                                    SizedBox(width: width / 46),
                                    Container(
                                      width: width / 2.1,
                                      child: Text(
                                        partner['address'] ?? "Shivaji Nagar, Jodhpur, Rajasthan 342001, India".tr,
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
                          child: Container(height: 0.6, color: Colors.black54),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  Image.asset(DoctorPngimage.iconsp, height: 30, width: 30),
                                  SizedBox(width: 10),
                                  Text("ShopOwner", style: imedium.copyWith(fontSize: 14))
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: (partner['status'] == 'active' || partner['status'] == null)
                                          ? Colors.green
                                          : Colors.red
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  partner['status']?.toString().capitalizeFirst ?? "Active",
                                  style: iregular.copyWith(fontSize: 16),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // Stats Section
                SizedBox(height: height/36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatCircle(
                      icon: DoctorPngimage.user2,
                      value: partnerStat['complete_services']?.toString() ?? "2,000+",
                      label: "Complete service",
                    ),
                    _buildStatCircle(
                      icon: DoctorPngimage.medal,
                      value: partnerStat['experience']?.toString() ?? "10+",
                      label: "Experience",
                    ),
                    _buildStatCircle(
                      icon: DoctorPngimage.starfill,
                      value: partnerStat['rating']?.toString() ?? "5",
                      label: "Rating",
                    ),
                    _buildStatCircle(
                      icon: DoctorPngimage.messages,
                      value: partnerStat['total_reviews']?.toString() ?? "1,872",
                      label: "Reviews",
                    ),
                  ],
                ),

                // About Section
                SizedBox(height: height/36),
                Text("About me", style: isemibold.copyWith(fontSize: 20)),
                SizedBox(height: height/56),
                Text(
                  partner['about'] ?? "Mr. Dhaval Gangani is a highly skilled Mechanical Engineer specializing in machine design, thermal systems, and industrial automation....view more".tr,
                  style: iregular.copyWith(fontSize: 14),
                ),

                // Working Time
                SizedBox(height: height/36),
                Text("Working_Time", style: isemibold.copyWith(fontSize: 20)),
                SizedBox(height: height/56),
                Text(
                  partner['working_hours'] ?? "Monday-Friday, 08.00 AM-18.00 pM".tr,
                  style: iregular.copyWith(fontSize: 14),
                ),

                // KYC Section
                SizedBox(height: height/36),
                Visibility(
                  visible: partner == null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kyc", style: isemibold.copyWith(fontSize: 20)),
                      SizedBox(height: height/56),
                      if (partner["aadhaar_front"] != null || partner.isNotEmpty) ...[
                        Text("Aadhar Card", style: iregular.copyWith(fontSize: 16)),
                        SizedBox(height: height/56),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildDocumentImage(
                              imageUrl: ApiService.kycDocimageurl+partner['aadhaar_front'],
                              placeholder: "assets/assetN/AadharcardDummy.png",
                              tag: 'aadhar_front',
                            ),
                            _buildDocumentImage(
                              imageUrl: ApiService.kycDocimageurl+partner['aadhaar_front'],
                              placeholder: "assets/assetN/AadharcardDummy.png",
                              tag: 'aadhar_back',
                            ),
                          ],
                        ),
                        SizedBox(height: height/70),
                      ],

                      if (partner['pan_card_image'] != null) ...[
                        Text("Pan Card", style: iregular.copyWith(fontSize: 16)),
                        SizedBox(height: height/56),
                        _buildDocumentImage(
                          imageUrl: ApiService.kycDocimageurl+partner['pan_card_image'],
                          placeholder: "assets/assetN/PanCardDummy.png",
                          tag: 'pan_card',
                        ),
                        SizedBox(height: height/70),
                      ],

                      if (partner['udyam_aadhar_certificate'] != null ) ...[
                        Text("Business certificate", style: iregular.copyWith(fontSize: 16)),
                        SizedBox(height: height/56),
                        _buildDocumentImage(
                          imageUrl:  ApiService.kycDocimageurl+partner['udyam_aadhar_certificate'],
                          placeholder: "assets/assetN/BusinessDummy.png",
                          tag: 'business_cert',
                        ),
                      ],
                    ],
                  ),
                ),


                // Reviews Section
                SizedBox(height: height/36),
                Row(
                  children: [
                    Text("Reviews", style: isemibold.copyWith(fontSize: 20)),
                    Spacer(),
                    Text("See_All", style: imedium.copyWith(fontSize: 14)),
                  ],
                ),
                SizedBox(height: height/36),
                _buildReviewsList(),

                SizedBox(height: height/36),
              ],
            ),
          ),
        );
      }),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(left: 30.0),
      //   child: InkWell(
      //     splashColor: DoctorColor.transparent,
      //     highlightColor: DoctorColor.transparent,
      //     onTap: () {
      //       Navigator.push(context, MaterialPageRoute(
      //         builder: (context) {
      //           return const DoctorBookAppointment();
      //         },
      //       ));
      //     },
      //     child: Container(
      //       height: height / 15,
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(50),
      //           color: DoctorColor.primary),
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: width/22),
      //         child: Center(
      //           child: Text("Book_Appointment".tr,
      //               style: imedium.copyWith(
      //                   fontSize: 16, color: DoctorColor.white)),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class ShopOwnerDetailsController extends GetxController {
  var isLoading = false.obs;
  var subPartnerDetails = {}.obs;
  var subPartnerDetailsReviews = [].obs;
  var subPartnerDetailsStatics = {}.obs;
  var errorMessage = ''.obs;

  Future<void> callShopOwnerDetail(String userId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final response = await ApiService.callShopOwnerDetail({
        "user_id": userId,
      });

      if (response != null && response['statusCode'] == 200) {
        subPartnerDetails.value = response['data'] ?? {};
        subPartnerDetailsStatics.value = response['statics_count'] ?? {};
        subPartnerDetailsReviews.value = response['reviews'];
        print("Reviews ${subPartnerDetailsReviews.value}");
        print("ReviewsDe ${subPartnerDetails.value}");
      } else {
        errorMessage.value = response['message'] ?? "Failed to fetch sub partner details";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }
}