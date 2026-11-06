import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';

abstract class AuthRepoInterface {
  Future<ApiResult<String>> register(SignUpRequestModel request);
  Future<ApiResult<LoginModel>> login(String email, String password);
}