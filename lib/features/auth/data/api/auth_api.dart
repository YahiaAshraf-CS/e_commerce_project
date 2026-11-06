import 'dart:convert';

import 'package:e_commerce/core/constants/api_constant.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';
import 'package:e_commerce/features/auth/presentation/view_model/register/sign_up_cubit.dart';
import 'package:http/http.dart' as http;

abstract class AuthApi {
  //https://supermarket-dan1.onrender.com/api/v1
  // /auth/signUp
 static Future<ApiResult<String>> Register(SignUpRequestModel request) async {
    try {
      var url = Uri.parse('${ApiConstant.baseUrl + ApiConstant.signup}');
      var response = await http.post(url, body: jsonEncode(request.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      var requestBody = response.body;
      var json = jsonDecode(requestBody);

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        return ApiSuccess(json["message"]);
      } else {
        return ApiError(json["message"]);
      }
    } catch (e) {
      return ApiError("$e");
    }
  }

 static Future <ApiResult<LoginModel>> Login( String email, String password) async {
   try{
   Uri url = Uri.parse('${ApiConstant.baseUrl + ApiConstant.login}');
   var response = await http.post(url, body: jsonEncode({"email": email, "password": password}), headers: {'Content-Type': 'application/json'});
   var requestBody = response.body;
   var json = jsonDecode(requestBody);
   if (response.statusCode >= 200 && response.statusCode <= 300) {
     return ApiSuccess(LoginModel.fromJson(json));
   } else {
     return ApiError(json["message"]);
   }
   } catch(e){
    return ApiError("$e");
   }
 }
}



