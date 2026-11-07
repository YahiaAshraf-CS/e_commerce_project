import 'dart:convert';

import 'package:e_commerce/core/constants/api_constant.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/core/utils/app_flutter_secure_storage.dart';
import 'package:e_commerce/features/home/data/model/categories_list_model.dart';
import 'package:e_commerce/features/home/data/model/product_list_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeApi {
  static Future<ApiResult<CategoriesListDto>> getAllCategories() async {
    try {
      var url = Uri.parse('${ApiConstant.baseUrl}${ApiConstant.categories}');
      var token = await AppFlutterSecureStorage.getSecureData('Token');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        return ApiSuccess(CategoriesListDto.fromJson(json));
      } else {
        return ApiError(_errorMessage(response.body));
      }
    } catch (e) {
      return ApiError("$e");
    }
  }

  static Future<ApiResult<ProductListDto>> getAllProducts() async {
    try {
      var url = Uri.parse('${ApiConstant.baseUrl}${ApiConstant.products}');
      var token = await AppFlutterSecureStorage.getSecureData('Token');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        return ApiSuccess(ProductListDto.fromJson(json));
      } else {
        return ApiError(_errorMessage(response.body));
      }
    } catch (e) {
      return ApiError("$e");
    }
  }

  static String _errorMessage(String body) {
    try {
      return jsonDecode(body)["message"]?.toString() ?? "Something went wrong";
    } catch (_) {
      return "Something went wrong";
    }
  }
}
