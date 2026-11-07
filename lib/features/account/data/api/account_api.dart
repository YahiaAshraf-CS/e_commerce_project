import "package:e_commerce/core/constants/api_constant.dart";
import "package:e_commerce/core/network/api_result.dart";
import "package:e_commerce/core/utils/app_flutter_secure_storage.dart";
import "package:e_commerce/features/account/data/models/user_data_dto.dart";
import "package:e_commerce/features/account/domain/entities/user_data_entity.dart";
import "package:http/http.dart" as http;
import 'dart:convert';


 class AccountApi {
  static Future<ApiResult<UserDataDto>> getUserData() async {
    var url = Uri.parse("${ApiConstant.baseUrl + ApiConstant.userProfile}");
    var token = await AppFlutterSecureStorage.getSecureData("Token");
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var json = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
       return ApiSuccess(UserDataDto.fromJson(json));
    } else {
      return ApiError(json);
    }
  }
}
