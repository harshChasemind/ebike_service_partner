import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DoctorCms extends StatefulWidget {
  String? type;

  DoctorCms(this.type, {super.key});

  @override
  State<DoctorCms> createState() => _KidsCmsState();
}

class _KidsCmsState extends State<DoctorCms> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        // title: Text(widget.type == "privacy"
        //     ? "Privacy_policy".tr
        //     : widget.type == "terms"
        //     ? "Terms_Conditions".tr
        //     : "About_Us".tr,style: isemibold.copyWith(fontSize: 20),),
        title: Text("Coming Soon",style: isemibold.copyWith(fontSize: 20,color: Colors.red),),
      ),

      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Last update: 05/02/2023".tr,
              style: iregular.copyWith(fontSize: 12, color: DoctorColor.grey),
            ),
            SizedBox(
              height: height / 96,
            ),
            Text(
              widget.type == "privacy"
                  ? "Please read these privacy policy, carefully before using our app operated by us."
                  : widget.type == "terms"
                      ? "Please read these terms of service, carefully before using our app operated by us."
                      : "Please read these about us, carefully before using our app operated by us.",
              style: iregular.copyWith(fontSize: 14),
            ),
            SizedBox(
              height: height / 56,
            ),
            Text(
              widget.type == "privacy"
                  ? "Privacy Policy"
                  : widget.type == "terms"
                      ? "Conditions of Uses"
                      : "About Us",
              style: ibold.copyWith(fontSize: 18),
            ),
            SizedBox(
              height: height / 96,
            ),
            Text(
              widget.type == "privacy"
                  ? "There are many variations of passages of Lorem lpsum available, but the majority have suffered alteration is some from, by injected humour, or randomised words which don't look even slightly believable.\nIf you are going to use a passage of Lorem lpsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem lpsum generators on the internet tend to respect predefined chunks as necessary, making this the first true generate on the internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem lpsum which looks reasonable.\nThe generated Lorem lpsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
                  : widget.type == "terms"
                      ? "It is long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem lpsum is that it has a more-or-less normal distribution of letters, as opposed to using 'content here, content here'. making it look like readable English. Many desktop publishing package and web page editors now use Lorem lpsum as their default mode text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose(injected humour and the like)."
                      : "If you are going to use a passage of Lorem lpsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem lpsum generators on the internet tend to respect predefined chunks as necessary, making this the first true generate on the internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem lpsum which looks reasonable.\nThe generated Lorem lpsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
              style: iregular.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
