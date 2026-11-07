import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';

abstract class AccountRepoInterface {
  Future<ApiResult<UserDataEntity>> getUserData();
}
