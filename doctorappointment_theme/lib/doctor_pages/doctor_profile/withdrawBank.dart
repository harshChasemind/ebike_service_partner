import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

class WithdrawmoneyBank extends StatefulWidget {
  const WithdrawmoneyBank({super.key});

  @override
  State<WithdrawmoneyBank> createState() => _WithdrawmoneyBankState();
}

class _WithdrawmoneyBankState extends State<WithdrawmoneyBank> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
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
          title: Text("Withdrawal"),
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
                        // readOnly: true,
                        // onTap: () {
                        //   Navigator.push(context, MaterialPageRoute(
                        //     builder: (context) {
                        //       return const DoctorList();
                        //     },
                        //   ));
                        // },
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          style: iregular.copyWith(
                              fontSize: 14, color: DoctorColor.textgrey),
                          decoration: InputDecoration(
                            hintText: 'Enter Your Account No.'.tr,
                            fillColor: themedata.isdark
                                ? DoctorColor.lightblack
                                : DoctorColor.white,
                            filled: true,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.all(15),
                            //   child: Image.asset(
                            //     DoctorPngimage.search,
                            //     height: height / 36,
                            //   ),
                            // ),
                            hintStyle: iregular.copyWith(
                                fontSize: 14, color: DoctorColor.textgrey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                          )),
                      SizedBox(
                        height: height / 80,
                      ),
                       TextFormField(
                        // readOnly: true,
                        // onTap: () {
                        //   Navigator.push(context, MaterialPageRoute(
                        //     builder: (context) {
                        //       return const DoctorList();
                        //     },
                        //   ));
                        // },
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          style: iregular.copyWith(
                              fontSize: 14, color: DoctorColor.textgrey),
                          decoration: InputDecoration(
                            hintText: 'Enter Your Confirm Account Mp.'.tr,
                            fillColor: themedata.isdark
                                ? DoctorColor.lightblack
                                : DoctorColor.white,
                            filled: true,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.all(15),
                            //   child: Image.asset(
                            //     DoctorPngimage.search,
                            //     height: height / 36,
                            //   ),
                            // ),
                            hintStyle: iregular.copyWith(
                                fontSize: 14, color: DoctorColor.textgrey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                          )),
                      SizedBox(
                        height: height / 80,
                      ),
                       TextFormField(
                        // readOnly: true,
                        // onTap: () {
                        //   Navigator.push(context, MaterialPageRoute(
                        //     builder: (context) {
                        //       return const DoctorList();
                        //     },
                        //   ));
                        // },
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          style: iregular.copyWith(
                              fontSize: 14, color: DoctorColor.textgrey),
                          decoration: InputDecoration(
                            hintText: 'Enter Your IFSC Code'.tr,
                            fillColor: themedata.isdark
                                ? DoctorColor.lightblack
                                : DoctorColor.white,
                            filled: true,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.all(15),
                            //   child: Image.asset(
                            //     DoctorPngimage.search,
                            //     height: height / 36,
                            //   ),
                            // ),
                            hintStyle: iregular.copyWith(
                                fontSize: 14, color: DoctorColor.textgrey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                          )),
                      SizedBox(
                        height: height / 80,
                      ),
                      TextFormField(
                        // readOnly: true,
                        // onTap: () {
                        //   Navigator.push(context, MaterialPageRoute(
                        //     builder: (context) {
                        //       return const DoctorList();
                        //     },
                        //   ));
                        // },
                          scrollPadding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          style: iregular.copyWith(
                              fontSize: 14, color: DoctorColor.textgrey),
                          decoration: InputDecoration(
                            hintText: 'Enter Account Holder Name'.tr,
                            fillColor: themedata.isdark
                                ? DoctorColor.lightblack
                                : DoctorColor.white,
                            filled: true,
                            // prefixIcon: Padding(
                            //   padding: const EdgeInsets.all(15),
                            //   child: Image.asset(
                            //     DoctorPngimage.search,
                            //     height: height / 36,
                            //   ),
                            // ),
                            hintStyle: iregular.copyWith(
                                fontSize: 14, color: DoctorColor.textgrey),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: DoctorColor.border)),
                          )),
                      SizedBox(height: height / 3,),
                      Container(
                        width: width / 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 0.7,
                                color: DoctorColor.blueBG
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Image.asset(DoctorPngimage.iconBank , height: 30, width: 30,),
                              SizedBox(width: 10,),
                              Text("Bank Account", style: imedium.copyWith(fontSize: 14),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          showAddSuccessDialog(context, 650);
                        },
                        child: Container(
                          width: width / 1,
                          decoration: BoxDecoration(
                              color: DoctorColor.blueBG,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 0.7,
                                  color: DoctorColor.blueBG
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Withdraw Confirm", style: ibold.copyWith(fontSize: 16 , color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
  void showAddSuccessDialog(BuildContext context, double amount) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Success Icon
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    // color: Colors.green.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(DoctorPngimage.iconConfirm),
                ),
                const SizedBox(height: 20),

                // ✅ Title
                Text(
                  "Add Success",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),

                // ✅ Subtitle
                Text(
                  "Your money has been added successfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 20),

                // ✅ Amount
                Text(
                  "Amount",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                const SizedBox(height: 5),
                Text(
                  "₹${amount.toStringAsFixed(0)}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                const SizedBox(height: 30),

                // ✅ Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Optionally navigate to home using GetX:
                      // Get.offAll(HomePage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DoctorColor.blueBG,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Back Home",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
