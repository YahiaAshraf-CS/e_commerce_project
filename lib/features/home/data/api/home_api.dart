import 'dart:convert';

import 'package:e_commerce/core/constants/api_constant.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/core/utils/app_flutter_secure_storage.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';
import 'package:e_commerce/features/auth/presentation/view_model/register/sign_up_cubit.dart';
import 'package:e_commerce/features/home/data/model/categories_list_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeApi {
   
  // we use static methods to call the api without creating an instance of the class
  static Future<ApiResult<CategoriesList>> getAllCategories() async {
    try {
      var url = Uri.parse('${ApiConstant.baseUrl}${ApiConstant.categories}');
      var token = await AppFlutterSecureStorage.getSecureData('Token');
      var response = await http.get(url, headers: {'Content-Type': 'application/json','Accept': 'application/json','Authorization': 'Bearer $token'});
      var requestBody = response.body;// we use response.body to get the response body as a string
     var json = jsonDecode(requestBody);
      if (response.statusCode >= 200 && response.statusCode <= 300) {
       // we use jsonDecode to convert the string to json
       
        return ApiSuccess(CategoriesList.fromJson(json));// we use ApiSuccess to return the success response
      } else {
        return ApiError(json["message"]);
      }
    } catch (e) {
      return ApiError("$e");
    }
    }
  }

