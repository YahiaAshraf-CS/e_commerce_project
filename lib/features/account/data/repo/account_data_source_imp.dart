import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/data/api/account_api.dart';
import 'package:e_commerce/features/account/data/models/user_data_dto.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';
import 'package:e_commerce/features/account/domain/repo/account_data_source_interface.dart';

class AccountDataSourceImp implements AccountDataSourceInterface {
  final AccountApi _api;

  AccountDataSourceImp(this._api);
  @override
  Future<ApiResult<UserDataEntity>> getUserData() async {
    final resDto = await _api.getUserData();
    switch (resDto) {
      case ApiSuccess<UserDataDto>():
        return ApiSuccess(resDto.data.toEntity());
      case ApiError():
        return ApiError(resDto.message);
    }
  }

  @override
  Future<ApiResult<String>> updateUserData({
    required String name,
    required String email,
    required String image,
    required String address,
    required String phone,
  }) async {
    return await _api.updateDataUser(
      name: name,
      email: email,
      phone: phone,
      image: image,
      address: address,
    );
  }
}


AccountDataSourceInterface injectAccountDataSource() => AccountDataSourceImp(injectableAccountApi());