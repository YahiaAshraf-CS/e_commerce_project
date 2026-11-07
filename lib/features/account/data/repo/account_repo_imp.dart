import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/data/repo/account_data_source_imp.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';
import 'package:e_commerce/features/account/domain/repo/account_data_source_interface.dart';
import 'package:e_commerce/features/account/domain/repo/account_repo_interface.dart';

class AccountRepoImp implements AccountRepoInterface{
  final AccountDataSourceImp repo;
  AccountRepoImp(this.repo);
  @override
  Future<ApiResult<UserDataEntity>> getUserData() async {
    return await repo.getUserData();
  }
}