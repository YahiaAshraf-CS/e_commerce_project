import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/data/repo/account_repo_imp.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';
import 'package:e_commerce/features/account/domain/use_case/get_user_data_use_case.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.getUserDataUseCase) : super(AccountInitial());
  final GetUserDataUseCase getUserDataUseCase;
  // we use it to get user data
  Future<void> getUserData() async {
    emit(AccountLoading());
    final result = await getUserDataUseCase.invoke();
    switch(result){
      case ApiSuccess<UserDataEntity>():
        emit(AccountSuccess(userDataEntity: result.data));
      case ApiError():
        emit(AccountError(result.message));
    }
  }
}
