//first always start with interface then implement it in the implementation class
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';

abstract class AuthDataSourceInterface {
    Future<ApiResult<String>> register(SignUpRequestModel request);
    Future<ApiResult<LoginModel>> login(String email, String password);
}