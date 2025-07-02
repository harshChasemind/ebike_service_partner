import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_signin.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../ApiService/ApiService.dart';
import '../doctor_pages/doctor_home/add_shop_owners.dart';
import '../doctor_pages/doctor_home/doctor_details.dart';
import '../doctor_pages/doctor_home/add_sub_partner.dart';
import '../doctor_pages/doctor_home/doctor_details_backup.dart';
import '../doctor_pages/doctor_home/shopOwnerdetail.dart';

class ShopOwnersList extends StatefulWidget {
  final String title;
  const ShopOwnersList({super.key, required this.title});

  @override
  State<ShopOwnersList> createState() => _ShopOwnersListState();
}

class _ShopOwnersListState extends State<ShopOwnersList> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  final themedata = Get.put(DoctorThemecontroler());
  final controller = Get.put(ShopOwnersController());
  @override
  void initState() {
    super.initState();
    // Replace '1' with actual user ID
    controller.fetchSubPartners("");
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: themedata.isdark ? DoctorColor.black : DoctorColor.white,
        title: const Text("Shop-Owners"),
        // leading: const Icon(Icons.arrow_back, size: 20),
        leading: Navigator.of(context).canPop() ? IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,size: 20)) : null,
        actions: [
          Stack(
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
              const Positioned(
                right: 8,
                top: 8,
                child: CircleAvatar(radius: 5, backgroundColor: Colors.red),
              )
            ],
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.subPartners.isEmpty) {
          return const Center(child: Text("No Shop Owners found"));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.filterController,
                  onChanged: (value){
                    controller.fetchSubPartnersFilter(value);
                  },
                  scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  style: iregular.copyWith(fontSize: 14, color: DoctorColor.black),
                  decoration: InputDecoration(
                    hintText: 'Search...'.tr,
                    fillColor: themedata.isdark ? DoctorColor.lightblack : DoctorColor.bgcolor,
                    filled: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(DoctorPngimage.search, height: height / 36),
                    ),
                    suffixIcon: IconButton(
                      icon: Image.asset(DoctorPngimage.filter, height: height / 36),
                      onPressed: () {
                        // TODO: Add filter functionality
                      },
                    ),
                    hintStyle: iregular.copyWith(fontSize: 14, color: DoctorColor.textgrey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border)),
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.subPartners.length,
                  itemBuilder: (context, index) {
                    final partner = controller.subPartners[index];
                    return GestureDetector(
                      onTap: () => Get.to(() => ShopOwnerDetails(userId:partner['_id'] ,)),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      DoctorPngimage.up1,
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          partner['name'] ?? '',
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Image.asset(DoctorPngimage.icCall, height: height / 45),
                                            const SizedBox(width: 4),
                                            Text(partner['mobile_number'] ?? ''),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Image.asset(DoctorPngimage.location, height: height / 45),
                                            const SizedBox(width: 4),
                                            Container(width: width / 2.1,child: Text(partner['address'] ?? '')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(DoctorPngimage.iconsp, height: height / 60),
                                      const SizedBox(width: 4),
                                      const Text("Shop Owner"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.circle, size: 12,  color: partner['kyc_status'] == false ? Colors.yellow[800] : Colors.green),
                                      const SizedBox(width: 4),
                                      Text(partner['kyc_status'] == false ? 'InActive' : 'Active'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(() => const AddShopOwnerAccount()),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: DoctorColor.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 35),
        ),
      ),
    );
  }
}


class ShopOwnersController extends GetxController {
  TextEditingController filterController = TextEditingController();
  var isLoading = false.obs;
  var subPartners = [].obs;

  Future<void> fetchSubPartners(String Text) async {
    isLoading.value = true;
    ApiService apiService = new ApiService();
    final response = await apiService.ShopOwners(Text);

    isLoading.value = false;

    if (response != null && response is Map && response['statusCode'] == 200) {
      subPartners.value = response['data'];
    }  else {
      Get.snackbar("Error", "Failed to fetch sub partners");
    }
  }
  Future<void> fetchSubPartnersFilter(String Text) async {
    ApiService apiService = new ApiService();
    final response = await apiService.ShopOwners(Text);
    if (response != null && response is Map && response['statusCode'] == 200) {
      subPartners.value = List<Map<String, dynamic>>.from(response['data']);
    } else {
      Get.snackbar("Error", "Failed to fetch sub partners");
    }
  }
}
