import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:get/get.dart';

class DoctorReferral extends StatefulWidget {
  const DoctorReferral({Key? key}) : super(key: key);

  @override
  State<DoctorReferral> createState() => _DoctorReferralState();
}

class _DoctorReferralState extends State<DoctorReferral> {
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
        title: Text("Referral".tr,style: isemibold.copyWith(fontSize: 20),),
        leading: Navigator.of(context).canPop() ? IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)) : null,
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: width/36),
        //     child: Container(
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(5),
        //             color: DoctorColor.lightDark),
        //         child: Padding(
        //           padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/150),
        //           child: Text("1 New".tr,style: isemibold.copyWith(fontSize: 14,color: DoctorColor.white),),
        //         )),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Invite Image
            Center(
              child: Image.asset(
                DoctorPngimage.referral, // Update this path if needed
                height: 200,
              ),
            ),

            const SizedBox(height: 28),

            // Title
            Text(
              "Invite Your Friends and get \n₹100",
              style: isemibold.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            // Subtitle
            Text(
              "Share the code below and you will get ₹100",
              style: iregular.copyWith(color: Colors.grey, fontSize: 14),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 140),

            // Referral Code Box
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12,),
                decoration: BoxDecoration(
                  color: DoctorColor.bgcolor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        initialValue: "mir20222305874657",
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: isemibold.copyWith(fontSize: 14),
                      ),
                    ),
                    IconButton(
                      icon: Image.asset(
                        DoctorPngimage.copy, // Replace with your filter image asset
                        height: height / 36,
                      ),
                      onPressed: () {
                        // Add copy to clipboard logic if needed
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Invite Friends Button
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const InviteSuccessPopup(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: DoctorColor.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Invite Friends",
                    style: isemibold.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class InviteSuccessPopup extends StatelessWidget {
  const InviteSuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Coin Image
            Image.asset(
              DoctorPngimage.earncoin, // Replace with actual image path
              height: 200,
              width: 400,
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              "Congratulations!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 6),

            // Amount Earned
            Text(
              "You have just earned ₹50",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            // Subtitle
            Text(
              "One of your friends has joined by \nyour referral code. Do more \ninvitations to earn more.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 24),

            // Invite Another Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  // Optionally trigger another share here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: DoctorColor.primary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Invite Another",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

