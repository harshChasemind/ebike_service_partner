import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:get/get.dart';

import '../doctor_profile/doctor_notification.dart';

class DoctorFilter extends StatefulWidget {
  const DoctorFilter({Key? key}) : super(key: key);

  @override
  State<DoctorFilter> createState() => _DoctorFilterState();
}

class _DoctorFilterState extends State<DoctorFilter> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());

  List img = [
    DoctorPngimage.n1,
    DoctorPngimage.n2,
    DoctorPngimage.n3,
  ];

  List name = ["Appointment Success","Appointment Cancelled","Scheduled Changed"];

  List img1 = [
    DoctorPngimage.n1,
  ];

  List name1 = ["Appointment Success"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text(
          "Filter".tr,
          style: isemibold.copyWith(fontSize: 20),
        ),
        leading: Navigator.of(context).canPop()
            ? IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        )
            : null,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 36),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorNotification(),
                  ),
                );
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
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range
            Text("Date Range", style: isemibold.copyWith(fontSize: 14)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'From',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.calendar,height: height/36,),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      hintStyle: iregular.copyWith(fontSize: 14,color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),

                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'To',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.calendar,height: height/36,),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      hintStyle: iregular.copyWith(fontSize: 14,color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),

                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Job Type
            Text("Job Type", style: isemibold.copyWith(fontSize: 14)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: 'Repair',
              style:iregular.copyWith(fontSize: 14,color: Colors.black45),

        items: ['Repair', 'Install', 'Inspect']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
                // hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              ),
            ),
            const SizedBox(height: 16),

            // Status
            Text("Status", style: isemibold.copyWith(fontSize: 14)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: 'Completed',
              style: iregular.copyWith(fontSize: 14,color: Colors.black45),
              items: ['Pending', 'In Progress', 'Completed']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
                // hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              ),
            ),
            const SizedBox(height: 16),

            // Amount
            Text("Amount", style: isemibold.copyWith(fontSize: 14)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Min ₹',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      hintStyle: iregular.copyWith(fontSize: 14,color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Max ₹',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      hintStyle: iregular.copyWith(fontSize: 14,color: Colors.black45),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Assigned
            Text("Assigned", style: isemibold.copyWith(fontSize: 14)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              hint: const Text("Text Search"),
              style: iregular.copyWith(fontSize: 14,color: Colors.black45),
              items: ['User A', 'User B']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
                hintStyle: iregular.copyWith(fontSize: 14,color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: DoctorColor.border)),
              ),
            ),

            const Spacer(),

            // Reset / Apply Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.black), // Reset button text black
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DoctorColor.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    child: const Text(
                      "Apply",
                      style: TextStyle(color: Colors.white), // Apply button text white
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
