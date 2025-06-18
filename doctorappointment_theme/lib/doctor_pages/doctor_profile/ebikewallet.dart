import 'package:doctorappointment/doctor_pages/doctor_filer/doctor_filter.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_list.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/ebikeHistory.dart';
import 'package:doctorappointment/doctor_pages/doctor_profile/withdrawMoney.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class Ebikewallet extends StatefulWidget {
  const Ebikewallet({super.key});

  @override
  State<Ebikewallet> createState() => _EbikewalletState();
}

class _EbikewalletState extends State<Ebikewallet> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  var pageController = PageController();
  var selectedIndex = 0;
  final List<Map<String, dynamic>> transactions = [
    {"name": "Dhaval Patel", "time": "Today at 09:20 am", "amount": "₹570.00"},
    {"name": "Raj Patel", "time": "Today at 09:20 am", "amount": "₹670.00"},
    {"name": "Ishan Patel", "time": "Today at 09:20 am", "amount": "₹255.00"},
    {"name": "Keyur Patel", "time": "Today at 09:20 am", "amount": "₹670.00"},
    {"name": "Keyur Patel", "time": "Today at 09:20 am", "amount": "₹170.00"},
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
          title: Text("Wallet"),
          leading: Icon(Icons.arrow_back , size: 20,),
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
                            hintText: 'Search ...'.tr,
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
                            suffixIcon:  GestureDetector(
                              onTap: (){
                                Get.to(DoctorFilter());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                  DoctorPngimage.filter,
                                  height: height / 36,
                                ),
                              ),
                            ),

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
                        height: height / 36,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.to(Withdrawmoney());
                            },
                            child: Container(
                              width: width / 2.5,
                              decoration: BoxDecoration(
                                color: DoctorColor.blueBG,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Center(child: Text("Withdrawal" , style: imedium.copyWith(fontSize: 16 , color: Colors.white),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 36,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width/2.5,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(color: DoctorColor.primary2 , width: 0.7),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text("\u20B9500" , style: ibold.copyWith(fontSize: 16 , color: DoctorColor.primary2),),
                                  Text("Available Balance" , style: iregular.copyWith(fontSize: 12 , color: DoctorColor.black),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: width/2.5,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                              border: Border.all(color: DoctorColor.primary2 , width: 0.7),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text("\u20B9200" , style: ibold.copyWith(fontSize: 16 , color: DoctorColor.primary2),),
                                  Text("Total commission" , style: iregular.copyWith(fontSize: 12 , color: DoctorColor.black),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(Ebikehistory());
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Transaction List
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        final tx = transactions[index];
                        return Container(
                          width: width / 1,
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Left Icon
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  // color: Color(0xFFDFF8E9),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(DoctorPngimage.iconTS , height: 40, width: 40,),
                              ),
                              SizedBox(width: 5),
                              // Name and time
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transactions[index]['name'],
                                      style: isemibold.copyWith(fontSize: 14 ,),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      transactions[index]['time'],
                                      style: iregular.copyWith(fontSize: 12 , color: Colors.grey)
                                    ),
                                  ],
                                ),
                              ),
                              // Amount
                              Text(
                                transactions[index]['amount'],
                                style: isemibold.copyWith(fontSize: 14)
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
                    ]))));
  }
}
