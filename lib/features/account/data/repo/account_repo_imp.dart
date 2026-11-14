import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/data/repo/account_data_source_imp.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';
import 'package:e_commerce/features/account/domain/repo/account_data_source_interface.dart';
import 'package:e_commerce/features/account/domain/repo/account_repo_interface.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AccountRepoInterface)
class AccountRepoImp implements AccountRepoInterface {
  final AccountDataSourceInterface dataSource;

  AccountRepoImp(this.dataSource);

  @override
  Future<ApiResult<UserDataEntity>> getUserData() async {
    return await dataSource.getUserData();
  }

  @override
  Future<ApiResult<String>> updateUserData({
    required String name,
    required String email,
    required String image,
    required String address,
    required String phone,
  }) async {
    return await dataSource.updateUserData(
      name: name,
      email: email,
      image: image,
      address: address,
      phone: phone,
    );
  }
}

