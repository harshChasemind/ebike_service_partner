import 'package:doctorappointment/UserListScreens/SubpartnersList.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_list.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

import '../doctor_profile/doctor_notification.dart';
import '../doctor_profile/ebikewallet.dart';
import 'doctor_details.dart';

class Orderhistory extends StatefulWidget {
  const Orderhistory({super.key});

  @override
  State<Orderhistory> createState() => _OrderhistoryState();
}

class _OrderhistoryState extends State<Orderhistory> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  final List<Map<String, String>> orders = [
    {
      "orderId": "#MECH-2025-001",
      "date": "May 22, 2023",
      "name": "Darshan Patel",
      "location": "Jagatpura, Jaipur",
      "job": "Gearbox Repair",
      "assigned": "Engineer A",
      "amount": "₹5,200",
      "status": "Completed",
      "image": DoctorPngimage.up1, // Add your image here
    },
{
      "orderId": "#MECH-2025-001",
      "date": "May 22, 2023",
      "name": "Darshan Patel",
      "location": "Jagatpura, Jaipur",
      "job": "Gearbox Repair",
      "assigned": "Engineer A",
      "amount": "₹5,200",
      "status": "Completed",
      "image": DoctorPngimage.up2, // Add your image here
    },
{
      "orderId": "#MECH-2025-001",
      "date": "May 22, 2023",
      "name": "Darshan Patel",
      "location": "Jagatpura, Jaipur",
      "job": "Gearbox Repair",
      "assigned": "Engineer A",
      "amount": "₹5,200",
      "status": "Completed",
      "image": DoctorPngimage.up3, // Add your image here
    },
{
      "orderId": "#MECH-2025-001",
      "date": "May 22, 2023",
      "name": "Darshan Patel",
      "location": "Jagatpura, Jaipur",
      "job": "Gearbox Repair",
      "assigned": "Engineer A",
      "amount": "₹5,200",
      "status": "Completed",
      "image": DoctorPngimage.up1, // Add your image here
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
          title: Text("Order History" , style: imedium.copyWith(fontSize: 16),),
          // leading: Icon(Icons.arrow_back , size: 20,),
          actions: [
            InkWell(
              onTap: () {
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
                          color: Colors.red, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            ),
          ],

        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 36),
                child: Column(children: [
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
                        hintText: 'Search by Job Name / Order ID'.tr,
                        fillColor: themedata.isdark
                            ? DoctorColor.lightblack
                            : DoctorColor.bgcolor,
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
                            DoctorPngimage
                                .filter, // Replace with your filter image asset
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
                  ListView.builder(
                    padding: const EdgeInsets.all(12),
                    physics: ScrollPhysics(),
                    itemCount: orders.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Top row: Order ID and Date
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order : ${order["orderId"]}", style: const TextStyle(fontWeight: FontWeight.w600)),
                                  Text(order["date"] ?? "", style: const TextStyle(color: Colors.grey, fontSize: 13)),
                                ],
                              ),
                              const SizedBox(height: 10),

                              /// Image and details row
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Mechanic image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      order["image"] ?? "",
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  /// Details column
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(order["name"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on_outlined, size: 14, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(order["location"] ?? "", style: const TextStyle(color: Colors.grey, fontSize: 13)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text("Job : ${order["job"]}", style: const TextStyle(fontSize: 13)),
                                        Text("Assigned : ${order["assigned"]}", style: const TextStyle(fontSize: 13)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              /// Bottom row: Amount and Status
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(order["amount"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                  Row(
                                    children: [
                                      const Icon(Icons.circle, color: Colors.green, size: 12),
                                      const SizedBox(width: 6),
                                      Text(order["status"] ?? "", style: const TextStyle(color: Colors.green)),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ]))));
  }
}
