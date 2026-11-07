 import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';
import 'package:e_commerce/features/auth/data/repo/data_source/auth_data_source_interface.dart';
import 'package:e_commerce/features/auth/data/repo/repo/auth_repo_interface.dart';

class AuthRepoImp implements AuthRepoInterface {
  final AuthDataSourceInterface authDataSource;
  AuthRepoImp({required this.authDataSource});//repo
  @override
  Future<ApiResult<LoginModel>> login(String email, String password) async {
    return await authDataSource.login(email, password);
  }

  @override
  Future<ApiResult<String>> register(SignUpRequestModel request) async {
    return await authDataSource.register(request);
  }
}