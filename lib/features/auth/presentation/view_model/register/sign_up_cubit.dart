import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/api/auth_api.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
 Future <void> Register(SignUpRequestModel request) async {
    emit(SignUpLoading());
    String? messageSuccess;
    String? messageError;
    final result = await AuthApi.Register(request);
    switch(result){
      case ApiSuccess<String>():
        messageSuccess = result.data;
        emit(SignUpSuccess());
        break;
      case ApiError<String>():
        messageError = result.message;
        emit(SignUpError(message: '$messageError'));
        break;
    }
  }
}
