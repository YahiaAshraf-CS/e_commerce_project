part of 'account_cubit.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountSuccess extends AccountState {
  final UserDataEntity userDataEntity;
  AccountSuccess({required this.userDataEntity});
}

final class AccountError extends AccountState {
  final String messageError;
  AccountError(this.messageError);
}
