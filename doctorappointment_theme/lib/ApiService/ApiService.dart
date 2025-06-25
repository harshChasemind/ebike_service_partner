import 'dart:convert' as JSON;
import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static String imageurl = "https://e-bike.69clubs.site/uploads/profile/";
  static String kycDocimageurl = "https://e-bike.69clubs.site/uploads/kyc_documents/";
  static const String baseUrl = "https://e-bike.69clubs.site";
  static String token = "";

// static String My_Token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2Mzk5NTUxM2E0M2MwYTFkODRlY2U2YTEiLCJ1c2VyTmFtZSI6ImZmZ3kiLCJmaXJzdE5hbWUiOiJ0ZXN0IiwibGFzdE5hbWUiOiJ0ZXN0IiwiZW1haWwiOiJmZ3JAbWFpbGluYXRvci5jb20iLCJtb2JpbGUiOjg4NTU2NjY1ODgsImFjY291bnRUeXBlIjoxLCJyZWdpc3RlclN0YXR1cyI6MSwic3RhdHVzIjoxLCJpc3VzZXJ2ZXJpZmllZCI6ZmFsc2UsInByb2ZpbGVfaW1hZ2UiOiJuby11c2VyLnBuZyIsImp0aSI6IjYzOTk1NTEzYTQzYzBhMWQ4NGVjZTZhMV8wNDk4ODQiLCJpYXQiOjE2NzA5OTMxNzEsImV4cCI6MTY3MzU4NTE3MX0.mFtaQXY0y2Ty2TnPD2N3TWdNoVZBWxIf9mI3R5RlWRY";
// final String My_Token = ColorConstant.token;
  Map<String, String> HeaderNoToken = {'Content-Type': 'application/json'};

//For Login APi
  static Future<dynamic> login(Map<String, String> mobileNumber) async {
    print("Login Success $mobileNumber");
    print("$baseUrl/app/user/login");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/login'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: mobileNumber, // key-value format for x-www-form-urlencoded
      );
      print("Login Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in login $e");
    }
  }

  ///send OTP

  static Future<dynamic> callOtpVerify(
    Map<String, dynamic> verifyJson,
  ) async {
    print("Otp Success $verifyJson");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/otp-verify'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: verifyJson, // key-value format for x-www-form-urlencoded
      );
      print("OTP Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in login $e");
    }
  }

  ///resend otp

  static Future<dynamic> resendOTP(Map<String, String> data) async {
    print("Sending Resend OTP Request: $data");
    print("POST $baseUrl/app/user/resend_otp");

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/resend_otp'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: data,
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = convert.jsonDecode(response.body);
        return decoded;
      } else {
        print("Failed: Status Code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error in resendOTP: $e");
      return null;
    }
  }

  /// sub-partner list
  static Future<dynamic> SubPartner(String filter) async {
    print("Sending SubPartner Request: $token");
    print("POST $baseUrl/app/user/list_my_sub_partner");

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/list_my_sub_partner'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: filter,
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = convert.jsonDecode(response.body);
        return decoded;
      } else {
        print("Failed: Status Code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error in SubPartner: $e");
      return null;
    }
  }

  /// Shop owners list
  static Future<dynamic> ShopOwners(String filter) async {
    print("Sending SubPartner Request: $filter");
    print("POST $baseUrl/app/user/list_my_shop_owners");

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/list_my_shop_owners'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: filter,
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = convert.jsonDecode(response.body);
        return decoded;
      } else {
        print("Failed: Status Code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error in SubPartner: $e");
      return null;
    }
  }

  /// Freelancers list
  static Future<dynamic> Freelancers(String data) async {
    print("Sending SubPartner Request: $data");
    print("POST $baseUrl/app/user/list_my_freelancers");

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/list_my_freelancers'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: data,
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decoded = convert.jsonDecode(response.body);
        return decoded;
      } else {
        print("Failed: Status Code ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error in SubPartner: $e");
      return null;
    }
  }

  static Future<dynamic> callUserRegister(
      Map<String, dynamic> registerJson) async {
    print("register Success $registerJson");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/register'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: registerJson, // key-value format for x-www-form-urlencoded
      );
      print("register Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in register $e");
    }
  }

  ///call add sub partner details Api

  static Future<dynamic> callAddSubPartner(
      Map<String, dynamic> registerJson) async {
    print("register Success $registerJson");
    print("POST Add Sub Partner $baseUrl/app/user/add_subpartner");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/add_subpartner'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: registerJson, // key-value format for x-www-form-urlencoded
      );
      print("Add Sub Partner Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in register $e");
    }
  }

  ///call add Shop owner details Api

  static Future<dynamic> callShopOwner(
      Map<String, dynamic> registerJson) async {
    print("register Success $registerJson");
    print("POST Add Shop Owner $baseUrl/app/user/add_shop_owner_freelancer");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/add_shop_owner_freelancer'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: registerJson, // key-value format for x-www-form-urlencoded
      );
      print("Add Shop Owner Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in register $e");
    }
  }

  ///call add Freelancer details Api

  static Future<dynamic> callFreelancer(
      Map<String, dynamic> registerJson) async {
    print("register Success $registerJson");
    print("Add Freelancer $baseUrl/app/user/add_shop_owner_freelancer");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/add_shop_owner_freelancer'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: registerJson, // key-value format for x-www-form-urlencoded
      );
      print("Add Freelancer Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in register $e");
    }
  }

  static Future<dynamic> callUserProfile() async {
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/get_user_profile'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        // key-value format for x-www-form-urlencoded
      );
      print("profile data Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in register $e");
    }
  }

  static Future<dynamic> callUserEdit(
    Map<String, dynamic> editJson,
  ) async {
    print("register Success $editJson");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/register'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: editJson, // key-value format for x-www-form-urlencoded
      );
      print("register Success" + response.body);
      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in register $e");
    }
  }

  static Future<dynamic> uploadProfileImage(File imageFile) async {
    var uri = Uri.parse(
        '$baseUrl/app/user/profile_photo_update'); // Update this with your endpoint
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });

    request.files.add(await http.MultipartFile.fromPath(
      'profile_image', // <-- Change this key to match your backend field name
      imageFile.path,
    ));

    try {
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print("ResponseProfilePhoto: $responseBody");

      if (response.statusCode == 200) {
        return convert.jsonDecode(responseBody);
      } else {
        print('Failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print("Error during image upload: $e");
      return null;
    }
  }

  static Future<dynamic> callKycCertificate({
    required String AadharcardNumber,
    required File AadharFront,
    required File AadharBack,
    required String PanCardNum,
    required File Pancard,
  }) async {
    var uri = Uri.parse(
        '$baseUrl/app/user/upload_kyc_documents'); // Update this with your endpoint
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll({
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data',
    });

    request.files.add(await http.MultipartFile.fromPath(
      'aadhaar_front', // <-- Change this key to match your backend field name
      AadharFront.path,
    ));
    request.files.add(await http.MultipartFile.fromPath(
      'aadhaar_back', // <-- Change this key to match your backend field name
      AadharBack.path,
    ));

    request.files.add(await http.MultipartFile.fromPath(
      'pan_card_image', // <-- Change this key to match your backend field name
      Pancard.path,
    ));

    request.fields['aadhaar_number'] = AadharcardNumber;
    request.fields['pan_number'] = PanCardNum;

    try {
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print("ResponseProfilePhoto: $responseBody");

      if (response.statusCode == 200) {
        return convert.jsonDecode(responseBody);
      } else {
        print('Failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print("Error during image upload: $e");
      return null;
    }
  }
  static Future<dynamic> SubPartnerDetails(Map<String, String> data) async {
    print("Sending SubPartner Request: $data");
    print("POST $baseUrl/app/user/sub_partner_detail");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/sub_partner_detail'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
       body: data,
      );

      // print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in SubPartnerDetails: $e");
    }
  }
  static Future<dynamic> callShopOwnerDetail(Map<String, String> data) async {
    print("Sending SubPartner Request: $data");
    print("POST $baseUrl/app/user/shop_owner_detail");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/shop_owner_detail'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
       body: data,
      );

      // print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in SubPartnerDetails: $e");
    }
  }
  static Future<dynamic> callfreelancerDetail(Map<String, String> data) async {
    print("Sending SubPartner Request: $data");
    print("POST $baseUrl/app/user/freelancer_detail");
    var responseData;
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/app/user/freelancer_detail'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
       body: data,
      );

      // print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        responseData = JSON.jsonDecode(response.body);
        return responseData;
      }
    } catch (e) {
      print("Error in SubPartnerDetails: $e");
    }
  }
}
