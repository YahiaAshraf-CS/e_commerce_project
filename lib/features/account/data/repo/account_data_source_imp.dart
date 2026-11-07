import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/account/data/api/account_api.dart';
import 'package:e_commerce/features/account/data/models/user_data_dto.dart';
import 'package:e_commerce/features/account/domain/entities/user_data_entity.dart';
import 'package:e_commerce/features/account/domain/repo/account_repo_interface.dart';

class AccountDataSourceImp implements AccountRepoInterface{
  @override
  Future<ApiResult<UserDataEntity>> getUserData() async {
     final resDto = await AccountApi.getUserData();
     switch(resDto){
       case ApiSuccess<UserDataDto>():
         return ApiSuccess(resDto.data.toEntity());
       case ApiError():
         return ApiError(resDto.message);
     }
  }

}