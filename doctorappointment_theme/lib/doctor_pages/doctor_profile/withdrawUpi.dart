import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';

class WithdrawmoneyUpi extends StatefulWidget {
  const WithdrawmoneyUpi({super.key});

  @override
  State<WithdrawmoneyUpi> createState() => _WithdrawmoneyUpiState();
}

class _WithdrawmoneyUpiState extends State<WithdrawmoneyUpi> {
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
                            hintText: 'Enter Your UPI'.tr,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Enter your verify UPI" , style: iregular.copyWith(fontSize: 10),)
                        ],
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text("Select Account to Withdraw" , style: ibold.copyWith(fontSize: 16),),
                      SizedBox(
                        height: height / 50,
                      ),
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
                              Image.asset(DoctorPngimage.iconUpi , height: 30, width: 30,),
                              SizedBox(width: 10,),
                              Text("UPI Account", style: imedium.copyWith(fontSize: 14),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height / 2.5,),
                      Container(
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
                    ]))));
  }
}
