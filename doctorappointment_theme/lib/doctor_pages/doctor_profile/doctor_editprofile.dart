import 'package:doctorappointment/doctor_globalclass/doctor_color.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_fontstyle.dart';
import 'package:doctorappointment/doctor_globalclass/doctor_icons.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_fillprofile.dart';
import 'package:doctorappointment/doctor_pages/doctor_authentication/doctor_signin.dart';
import 'package:doctorappointment/doctor_pages/doctor_home/doctor_dashboard.dart';
import 'package:doctorappointment/doctor_theme/doctor_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ApiService/ApiService.dart';

class DoctorEditprofile extends StatefulWidget {
  final Map<String, dynamic> profileData;
   DoctorEditprofile({Key? key ,  required this.profileData}) : super(key: key);

  @override
  State<DoctorEditprofile> createState() => _DoctorEditprofileState();
}

class _DoctorEditprofileState extends State<DoctorEditprofile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DoctorThemecontroler());
  final controller = Get.put(ebikeEditProfile());
// Define at the top of _DoctorSignupState
  String? selectedType;
  String? selectedGender;

  List<String> types = ['Shop Owner', 'Freelancer'];
  List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> cityList = [
    "Ahmedabad",
    "Bangalore",
    "Chennai",
    "Delhi",
    "Dhenkanal",
    "Faridabad",
    "Ghaziabad",
    "Gr Noida",
    "Gurgaon",
    "Howrah",
    "Hyderabad",
    "Jaipur",
    "Kolkata",
    "Mohali",
    "Mumbai",
    "Noida",
    "Patna",
    "Portblair",
    "Pune",
    "Surat",
    "Suratgarh",
    "Thane",
    "Zirakpur"
  ];
  final List<String> stateList = [
    "Gujarat",
    "Karnataka",
    "Tamil Nadu",
    "Delhi",
    "Odisha",
    "Haryana",
    "Uttar Pradesh",
    "West Bengal",
    "Telangana",
    "Rajasthan",
    "Punjab",
    "Maharashtra",
    "Bihar",
    "Andaman & Nicobar",
  ];
  String capitalizeWords(String? input) {
    if (input == null || input.trim().isEmpty) return '';
    return input
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
  @override
  void initState() {
    super.initState();

    // Assign values from profileData to controllers
    controller.emailController.text = widget.profileData['email'] ?? '';
    controller._nameController.text = widget.profileData['name'] ?? '';
    controller._dateController.text = widget.profileData['dob'] ?? '';
    controller._addressController.text = widget.profileData['address'] ?? '';
    controller.cityValue.value = capitalizeWords(widget.profileData['city']);
    controller.stateValue.value = capitalizeWords(widget.profileData['state']);
    controller._pincodeController.text = widget.profileData['pincode'] ?? '';
    controller._businessNameController.text = widget.profileData['business_name'] ?? '';
    selectedGender = widget.profileData['gender'];
    final initialState = controller.stateValue.value;
    if (initialState.isNotEmpty && controller.stateCityMap.containsKey(initialState)) {
      controller.filteredCities.value = controller.stateCityMap[initialState]!;
    }
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: DoctorColor.white,
      appBar: AppBar(
        surfaceTintColor: DoctorColor.white,
        title: Text("Edit Profile".tr,style: isemibold.copyWith(fontSize: 20),),
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
      body: Obx(()=> SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width/36,vertical: height/36),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: controller._nameController,
                      validator: (value) => controller.validateNotEmpty(value, "Name"),
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      style: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                      decoration: InputDecoration(
                        hintText: 'Your_Name'.tr,
                        fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.white,
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(DoctorPngimage.user,height: height/36,color: DoctorColor.black,),
                        ),
                        hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                      )),
                  SizedBox(height: height/36,),

                  TextFormField(
                      controller: controller.emailController,
                      validator: controller.validateEmail,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      style: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                      decoration: InputDecoration(
                        hintText: 'Your_Email'.tr,
                        fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.white,
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(DoctorPngimage.email,height: height/36,color: DoctorColor.black,),
                        ),
                        hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                      )),
                  SizedBox(height: height/36,),
                  TextFormField(
                    controller: controller._dateController,
                    readOnly: true, // prevent keyboard from showing
                    onTap: ()  {
                      dobPicker();
                    },
                    validator: (value) => controller.validateNotEmpty(value, "Date of birth"),
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    style: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                    decoration: InputDecoration(
                      hintText: 'Date of Birth'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(DoctorPngimage.calendar, height: height / 36,color: DoctorColor.black,),
                      ),
                      hintStyle: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: DoctorColor.red)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: DoctorColor.border)),

                    ),
                  ),
                  SizedBox(height: height/36,),

                  // Gender Dropdown

                  DropdownButtonFormField<String>(
                    style: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                    decoration:  InputDecoration(
                      fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: DoctorColor.border)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: DoctorColor.border)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: DoctorColor.red)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:  BorderSide(color: DoctorColor.border)),
                    ),
                    hint: Text(
                      'Select Gender',
                      style: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                    ),
                    value: selectedGender,
                    validator: (value) => controller.validateNotEmpty(value, "Gender"),
                    items: genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender, style: iregular.copyWith(fontSize: 14)),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                  ),
                  // SizedBox(height: height/36,),
                  // TextFormField(
                  //     controller: controller._businessNameController,
                  //     validator: (value) => controller.validateNotEmpty(value, "Business Name"),
                  //     scrollPadding: EdgeInsets.only(
                  //         bottom: MediaQuery.of(context).viewInsets.bottom),
                  //     style: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                  //     decoration: InputDecoration(
                  //       hintText: 'Busiess Name'.tr,
                  //       fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.white,
                  //       filled: true,
                  //       prefixIcon: Padding(
                  //         padding: const EdgeInsets.all(15),
                  //         child: Image.asset(DoctorPngimage.iconBusiness,height: height/36,color: DoctorColor.textblack),
                  //       ),
                  //       hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: const BorderSide(color: DoctorColor.border)),
                  //       focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: const BorderSide(color: DoctorColor.border)),
                  //       errorBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: const BorderSide(color: DoctorColor.red)),
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //           borderSide: const BorderSide(color: DoctorColor.border)),
                  //     )),
                  SizedBox(height: height/36,),
                  TextFormField(
                      controller:controller._addressController,
                      validator: (value) => controller.validateNotEmpty(value, "Address"),
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      style: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                      decoration: InputDecoration(
                        hintText: 'Address'.tr,
                        fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.white,
                        filled: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(DoctorPngimage.iconBuilding,height: height/36,color: DoctorColor.textblack),
                        ),
                        hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                      )),
                  SizedBox(height: height/36,),
                  DropdownButtonFormField<String>(
                    value: controller.stateValue.value.isNotEmpty ? controller.stateValue.value : null,
                    style: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                    onChanged: (value) {
                      controller.stateValue.value = value ?? '';
                      controller.cityValue.value = '';
                      controller.filteredCities.value = controller.stateCityMap[value] ?? [];
                    },
                    validator: (value) => controller.validateNotEmpty(value, "State"),
                    decoration: InputDecoration(
                      hintText: 'State'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          DoctorPngimage.iconBuilding,
                          height: height / 36,
                          color: DoctorColor.textblack,
                        ),
                      ),
                      hintStyle: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: DoctorColor.red)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: DoctorColor.border)),
                    ),
                    items: stateList.map((state) {
                      return DropdownMenuItem<String>(
                        value: state,
                        child: Text(
                          state,
                          style: iregular.copyWith(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: height/36,),
                  DropdownButtonFormField<String>(
                    value: controller.cityValue.value.isNotEmpty ? controller.cityValue.value : null,
                    style: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                    onChanged: (value) {
                      controller.cityValue.value = value ?? '';
                    },
                    validator: (value) => controller.validateNotEmpty(value, "City"),
                    decoration: InputDecoration(
                      hintText: 'City'.tr,
                      fillColor: themedata.isdark ? DoctorColor.lightblack : DoctorColor.white,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          DoctorPngimage.iconBuilding,
                          height: height / 36,
                          color: DoctorColor.textblack,
                        ),
                      ),
                      hintStyle: iregular.copyWith(fontSize: 14, color: DoctorColor.textblack),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.red),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: DoctorColor.border),
                      ),
                    ),
                    items: controller.filteredCities.map((city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(
                          city,
                          style: iregular.copyWith(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: height/36,),
                  TextFormField(
                      controller:controller._pincodeController,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      validator: (value) => controller.validateNotEmpty(value, "Pincode"),
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      style: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                      decoration: InputDecoration(
                        hintText: 'Pincode'.tr,
                        fillColor: themedata.isdark ? DoctorColor.lightblack :DoctorColor.white,
                        filled: true,
                        counterText: '',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(DoctorPngimage.iconBuilding,height: height/36,color: DoctorColor.textblack),
                        ),
                        hintStyle: iregular.copyWith(fontSize: 14,color: DoctorColor.textblack),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.red)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: DoctorColor.border)),
                      )),

                  SizedBox(height: height/26,),
                  InkWell(
                    splashColor: DoctorColor.transparent,
                    highlightColor: DoctorColor.transparent,
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        // If valid, go to next screen
                        controller.userEdit(
                            context: context,
                            name: controller._nameController.text,
                            email: controller.emailController.text,
                            dob: controller._dateController.text,
                            gender: selectedGender ?? "male",
                            address: controller._addressController.text,
                            city: controller.cityValue.value,
                            state: controller.stateValue.value,
                            pincode: controller._pincodeController.text);
                      }
                    },
                    child: Container(
                      height: height / 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: DoctorColor.blueBG),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width/22),
                        child: Center(
                          child: Text("Save".tr,
                              style: imedium.copyWith(
                                  fontSize: 16, color: DoctorColor.white)),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void dobPicker () async{
    final DateTime today = DateTime.now(); // ✅ Declare today
    DateTime? pickedDate = await showDatePicker(
      context: context,
        initialDate: DateTime(today.year - 18, today.month, today.day),
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(today.year - 18, today.month, today.day)
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";

      print(formattedDate);
      setState(() {
        controller._dateController.text = formattedDate;
      });
    }
  }
}
class ebikeEditProfile extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var cityValue = ''.obs;
  var stateValue = ''.obs;
  var filteredCities = <String>[].obs;
  final Map<String, List<String>> stateCityMap = {
    "Gujarat": ["Ahmedabad", "Surat"],
    "Karnataka": ["Bangalore"],
    "Tamil Nadu": ["Chennai"],
    "Delhi": ["Delhi"],
    "Odisha": ["Dhenkanal"],
    "Haryana": ["Faridabad", "Gurgaon"],
    "Uttar Pradesh": ["Ghaziabad", "Gr Noida", "Noida"],
    "West Bengal": ["Howrah", "Kolkata"],
    "Telangana": ["Hyderabad"],
    "Rajasthan": ["Jaipur", "Suratgarh"],
    "Punjab": ["Mohali", "Zirakpur"],
    "Maharashtra": ["Mumbai", "Pune", "Thane"],
    "Bihar": ["Patna"],
    "Andaman & Nicobar": ["Portblair"],
  };
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
  String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }
  Future<void>userEdit(
      {
        required BuildContext context,
        required String name,
        required String email,
        required String dob,
        required String gender,
        required String address,
        required String city,
        required String state,
        required String pincode,
      }) async {
    Map<String , Object> editUserJson = {
      "name": name,
      "email": email,
      "dob": dob,
      "gender": gender,
      "address": address,
      "city": city,
      "state": state,
      "pincode": pincode.toString(),
    };
    isLoading.value = true;
    ApiService apiService = new ApiService();
    final response = await apiService.callUserEdit(editUserJson);
    isLoading.value = false;
    if (response != null && response['statusCode'] == 200) {
      Get.to(DoctorDashboard(3));
    } else {
      Get.snackbar("Error", response['message'] ?? "OTP verification failed");
    }
  }
  @override
  void onInit() {
    super.onInit();
    if (stateValue.value.isNotEmpty) {
      filteredCities.value = stateCityMap[stateValue.value] ?? [];
    }
  }
}