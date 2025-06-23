import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_signin.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../doctor_pages/doctor_home/doctor_details.dart';
import '../doctor_pages/doctor_home/newAccountadd.dart';

class SubpartnerList extends StatefulWidget {
  String? title;
   SubpartnerList({super.key , required this.title});

  @override
  State<SubpartnerList> createState() => _SubpartnerListState();
}

class _SubpartnerListState extends State<SubpartnerList> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  final List<Map<String, String>> partners = [
    {
      "name": "Dhaval Patel",
      "phone": "9876543210",
      "location": "Jaghatpura, Jaipur",
      "role": "Sub-Partner",
      "status": "Active",
      "image": DoctorPngimage.up1, // Replace with your asset path
    },
     {
      "name": "Ravi Mehta",
      "phone": "9876543211",
      "location": "Malviya Nagar, Jaipur",
      "role": "Sub-Partner",
      "status": "Active",
      "image": DoctorPngimage.up2,
    },
     {
      "name": "Nikhil Shah",
      "phone": "9876543212",
      "location": "Vaishali Nagar, Jaipur",
      "role": "Sub-Partner",
      "status": "Active",
      "image": DoctorPngimage.up1,
    },
     {
      "name": "Meena Kumari",
      "phone": "9876543213",
      "location": "Mansarovar, Jaipur",
      "role": "Sub-Partner",
      "status": "Active",
      "image": DoctorPngimage.up2,
    },
     {
      "name": "Arjun Rathi",
      "phone": "9876543214",
      "location": "Tonk Road, Jaipur",
      "role": "Sub-Partner",
      "status": "Active",
      "image": DoctorPngimage.up3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor:
              themedata.isdark ? DoctorColor.black : DoctorColor.white,
          title: Text(widget.title! , style: imedium.copyWith(fontSize: 16),),
          leading: Icon(
            Icons.arrow_back,
            size: 20,
          ),
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
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 36),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(12),
                        physics: ScrollPhysics(),
                        itemCount: partners.length,
                        itemBuilder: (context, index) {
                          final partner = partners[index];
                          return GestureDetector(
                            onTap: (){
                              Get.to(DoctorDetails(title: widget.title!,));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                color: Colors.white, // or any background color you need
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2), // mimic Card elevation
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 1), // subtle shadow
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
                                            partner['image']!,
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
                                                partner['name']!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Image.asset(DoctorPngimage.icCall , height: height / 45,),
                                                  const SizedBox(width: 4),
                                                  Text(partner['phone']!),
                                                ],
                                              ),
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Image.asset(DoctorPngimage.location , height: height / 45,),
                                                  const SizedBox(width: 4),
                                                  Text(partner['location']!),
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
                                          children:  [
                                            Image.asset(DoctorPngimage.iconsp , height: height / 60,),
                                            SizedBox(width: 4),
                                            Text("Sub-Partner"),
                                          ],
                                        ),
                                        Row(
                                          children:  [
                                            Icon(Icons.circle, size: 12, color: Colors.green),
                                            SizedBox(width: 4),
                                            Text("Active"),
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
                      )
                    ]))),
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.to(PartnerAccount());
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: DoctorColor.primary,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.add , color: Colors.white, size: 35,),
        ),
      ),
    );
  }
}
