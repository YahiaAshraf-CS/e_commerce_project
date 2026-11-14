import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/data/repo/account_repo_imp.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';
import 'package:e_commerce/features/account/domain/repo/account_repo_interface.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetUserDataUseCase {
  final AccountRepoInterface repo;

  GetUserDataUseCase(this.repo);
  Future<ApiResult<UserDataEntity>> invoke() async => await repo.getUserData();
}


