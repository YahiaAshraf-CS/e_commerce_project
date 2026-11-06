import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/auth/data/models/signup_request.dart';
import 'package:e_commerce/features/auth/data/repo/repo/auth_repo_interface.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit( {required this.repo}) : super(SignUpInitial());
  final AuthRepoInterface repo;
  Future<void> Register(SignUpRequestModel request) async {
    emit(SignUpLoading());
    String? messageSuccess;
    String? messageError;
    final result = await repo.register(request);
    switch (result) {
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
