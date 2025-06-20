import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
class Mykyc extends StatefulWidget {
  const Mykyc({super.key});

  @override
  State<Mykyc> createState() => _MykycState();
}

class _MykycState extends State<Mykyc> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  String? selectedFileName;
  String? selectedFilePath;
  String? selectedFileNameAadhar;
  String? selectedFilePathAadhar;
 String? selectedFileNameAadharBack;
  String? selectedFilePathAadharBack;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFileName = result.files.first.name;
        selectedFilePath = result.files.first.path;
      });
    }
  }
  void viewFile() {
    if (selectedFilePath != null) {
      OpenFile.open(selectedFilePath);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No file selected to preview")),
      );
    }
  }

  void deleteFile() {
    setState(() {
      selectedFileName = null;
      selectedFilePath = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:
        themedata.isdark ? DoctorColor.black : DoctorColor.white,
        title: Text("My KYC"),
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        // actions: [
        //   Stack(
        //     children: [
        //       CircleAvatar(
        //         backgroundColor: DoctorColor.bgcolor,
        //         radius: 22,
        //         child: Image.asset(
        //           DoctorPngimage.notification,
        //           height: height / 30,
        //           color: DoctorColor.primary,
        //         ),
        //       ),
        //       Positioned(
        //         right: 8,
        //         top: 8,
        //         child: Container(
        //           width: 10,
        //           height: 10,
        //           decoration: const BoxDecoration(
        //               color: Colors.red, shape: BoxShape.circle),
        //         ),
        //       )
        //     ],
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
              child: Column(
                  children: [
                    SizedBox(height: height/36,),
                    TextFormField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        decoration: InputDecoration(
                          hintText: 'Aadhar Card No'.tr,
                          fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                          filled: true,
                          // prefixIcon: Padding(
                          //   padding: const EdgeInsets.all(15),
                          //   child: Image.asset(DoctorPngimage.calendar,height: height/36,),
                          // ),
                          hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border , width: 0.7)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border , width: 0.7)),
                        )),
                    SizedBox(height: height/36,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: pickFileAadhar,
                          child: Container(
                            width: width / 1.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: DoctorColor.bgcolor,
                                border: Border.all(color: DoctorColor.border , width: 0.7)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(selectedFileNameAadhar ?? "Upload Aadhar Front", style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: viewFileAadhar,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(DoctorPngimage.iconeye,height: height/30,),
                          ),
                        ),
                        GestureDetector(
                          onTap: deleteFileAadhar,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Image.asset(DoctorPngimage.icondelete,height: height/30,),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: height/36,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: pickFileAadharBack,
                          child: Container(
                            width: width / 1.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: DoctorColor.bgcolor,
                                border: Border.all(color: DoctorColor.border , width: 0.7)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(selectedFileNameAadharBack ?? "Upload Aadhar Back", style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: viewFileAadharBack,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(DoctorPngimage.iconeye,height: height/30,),
                          ),
                        ),
                        GestureDetector(
                          onTap: deleteFileAadharBack,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Image.asset(DoctorPngimage.icondelete,height: height/30,),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: height/36,),
                    TextFormField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                        decoration: InputDecoration(
                          hintText: 'PAN Card No'.tr,
                          fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.bgcolor,
                          filled: true,
                          // prefixIcon: Padding(
                          //   padding: const EdgeInsets.all(15),
                          //   child: Image.asset(DoctorPngimage.calendar,height: height/36,),
                          // ),
                          hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border , width: 0.7)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: DoctorColor.border , width: 0.7)),
                        )),
                    SizedBox(height: height/36,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: pickFile,
                          child: Container(
                            width: width / 1.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: DoctorColor.bgcolor,
                                border: Border.all(color: DoctorColor.border , width: 0.7)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(selectedFileName ?? "Upload Pan Card", style: iregular.copyWith(fontSize: 14,color: DoctorColor.textgrey),),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: viewFile,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(DoctorPngimage.iconeye,height: height/30,),
                          ),
                        ),
                        GestureDetector(
                          onTap: deleteFile,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Image.asset(DoctorPngimage.icondelete,height: height/30,),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: height/26,),
                    InkWell(
                      splashColor: DoctorColor.transparent,
                      highlightColor: DoctorColor.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: height / 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: DoctorColor.blueBG),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width/22),
                          child: Center(
                            child: Text("Submit".tr,
                                style: imedium.copyWith(
                                    fontSize: 16, color: DoctorColor.white)),
                          ),
                        ),
                      ),
                    ),
                  ]))),);
  }


  Future<void> pickFileAadhar() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFileNameAadhar = result.files.first.name;
        selectedFilePathAadhar = result.files.first.path;
      });
    }
  }

  void viewFileAadhar() {
    if (selectedFilePathAadhar != null) {
      OpenFile.open(selectedFilePathAadhar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No file selected to preview")),
      );
    }
  }

  void deleteFileAadhar() {
    setState(() {
      selectedFileNameAadhar = null;
      selectedFilePathAadhar = null;
    });
  }
   Future<void> pickFileAadharBack() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFileNameAadharBack = result.files.first.name;
        selectedFilePathAadharBack = result.files.first.path;
      });
    }
  }

  void viewFileAadharBack() {
    if (selectedFilePathAadharBack != null) {
      OpenFile.open(selectedFilePathAadharBack);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No file selected to preview")),
      );
    }
  }

  void deleteFileAadharBack() {
    setState(() {
      selectedFileNameAadharBack = null;
      selectedFilePathAadharBack = null;
    });
  }

}
