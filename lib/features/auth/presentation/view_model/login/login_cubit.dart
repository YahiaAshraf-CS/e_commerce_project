import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/api/auth_api.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:flutter/material.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    LoginModel? loginModel;
    String? messageError;
    final result = await AuthApi.Login(email, password);
    switch (result) {
      case ApiSuccess<LoginModel>():
        loginModel = result.data;

        emit(LoginSuccess());
        break;
      case ApiError<LoginModel>():
         messageError= result.message;
        emit(LoginError( messageError));

        break;
    }
  }
}
