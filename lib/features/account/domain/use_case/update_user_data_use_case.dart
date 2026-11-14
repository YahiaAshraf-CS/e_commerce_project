import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/domain/repo/account_repo_interface.dart';

class UpdateUserDataUseCase {
  final AccountRepoInterface Repo;

  UpdateUserDataUseCase(this.Repo);
  ///this use case is responsible for updating user data we use invoke method to call it
  Future<ApiResult<String>> invoke(
    {
      required String name,
      required String email,
      required String image,
      required String address,
      required String phone,
    }
  ) async => await Repo.updateUserData(
        name: name,
        email: email,
        image: image,
        address: address,
        phone: phone,
  );
}
