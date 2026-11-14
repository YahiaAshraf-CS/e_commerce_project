import "package:e_commerce/core/constants/api_constant.dart";
import "package:e_commerce/core/network/api_result.dart";
import "package:e_commerce/core/utils/app_flutter_secure_storage.dart";
import "package:e_commerce/features/account/data/models/user_data_dto.dart";
import "package:http/http.dart" as http;

import 'dart:convert';

class AccountApi {
   Future<ApiResult<UserDataDto>> getUserData() async {
    var url = Uri.parse("${ApiConstant.baseUrl + ApiConstant.userProfile}");
    var token = await AppFlutterSecureStorage.getSecureData("Token");
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    var json = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return ApiSuccess(UserDataDto.fromJson(json));
    } else {
      return ApiError(json);
    }
  }

   Future<ApiResult<String>> updateDataUser({
    required String name,
    required String email,
    required String phone,
    required String image,
    required String address,
  }) async {
    try {
      var url = Uri.parse("${ApiConstant.baseUrl+ApiConstant.editProfile}");
      var token = await AppFlutterSecureStorage.getSecureData("Token");

      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "name": name,
          "phone": phone,
          "email": email,
          "address": address,
          "image": image,
        }),
      );

      dynamic json;
      try {
        json = jsonDecode(response.body);
      } catch (_) {
        json = null;
      }

      final String? message =
          (json is Map ? (json['message'] ?? json['msg']) : null)?.toString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return ApiSuccess(message ?? 'Profile updated successfully');
      } else {
        return ApiError(
          message ?? 'Something went wrong (${response.statusCode})',
        );
      }
    } catch (e) {
      return ApiError(e.toString());
    }
  }


}

AccountApi injectableAccountApi(){
  return AccountApi();
}
