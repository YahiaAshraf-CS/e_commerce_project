 import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/api/auth_api.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';
import 'package:e_commerce/features/auth/data/repo/data_source/auth_data_source_interface.dart';
// we use interface to implement the methods in the implementation class
// the meaning of interface is to define the methods that we want to implement in the implementation class
// the implementation class is the class that implements the methods defined in the interface
 class AuthDataSourceImp implements AuthDataSourceInterface {
  @override
  Future<ApiResult<LoginModel>> login(String email, String password) async=> await  AuthApi.Login(email, password);
  @override
  Future<ApiResult<String>> register(SignUpRequestModel request) async => await AuthApi.Register(request);
   
   
 }