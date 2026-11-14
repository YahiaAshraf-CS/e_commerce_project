// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:e_commerce/features/account/data/api/account_api.dart' as _i523;
import 'package:e_commerce/features/account/data/repo/account_data_source_imp.dart'
    as _i140;
import 'package:e_commerce/features/account/data/repo/account_repo_imp.dart'
    as _i867;
import 'package:e_commerce/features/account/domain/repo/account_data_source_interface.dart'
    as _i78;
import 'package:e_commerce/features/account/domain/repo/account_repo_interface.dart'
    as _i1006;
import 'package:e_commerce/features/account/domain/use_case/get_user_data_use_case.dart'
    as _i842;
import 'package:e_commerce/features/account/domain/use_case/update_user_data_use_case.dart'
    as _i357;
import 'package:e_commerce/features/account/presentation/view_model/account_cubit.dart'
    as _i265;
import 'package:e_commerce/features/home/data/repo/home_data_source_imp.dart'
    as _i1025;
import 'package:e_commerce/features/home/data/repo/home_repo_imp.dart' as _i728;
import 'package:e_commerce/features/home/domin/repo/home_data_source_interface.dart'
    as _i827;
import 'package:e_commerce/features/home/domin/repo/home_repo_interface.dart'
    as _i546;
import 'package:e_commerce/features/home/domin/use_case/get_all_categories_user_case.dart'
    as _i102;
import 'package:e_commerce/features/home/domin/use_case/get_all_products_user_case.dart'
    as _i807;
import 'package:e_commerce/features/home/presentation/view_model/home_cubit.dart'
    as _i1038;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i523.AccountApi>(() => _i523.AccountApi());
    gh.factory<_i827.HomeDataSourceInterface>(() => _i1025.HomeDataSourceImp());
    gh.factory<_i78.AccountDataSourceInterface>(
      () => _i140.AccountDataSourceImp(gh<_i523.AccountApi>()),
    );
    gh.factory<_i546.HomeRepoInterface>(
      () => _i728.HomeRepoImp(gh<_i827.HomeDataSourceInterface>()),
    );
    gh.factory<_i807.GetAllProductsUserCase>(
      () => _i807.GetAllProductsUserCase(gh<_i546.HomeRepoInterface>()),
    );
    gh.factory<_i102.GetAllCategoriesUseCase>(
      () => _i102.GetAllCategoriesUseCase(gh<_i546.HomeRepoInterface>()),
    );
    gh.factory<_i1006.AccountRepoInterface>(
      () => _i867.AccountRepoImp(gh<_i78.AccountDataSourceInterface>()),
    );
    gh.factory<_i1038.HomeCubit>(
      () => _i1038.HomeCubit(
        gh<_i102.GetAllCategoriesUseCase>(),
        gh<_i807.GetAllProductsUserCase>(),
      ),
    );
    gh.factory<_i842.GetUserDataUseCase>(
      () => _i842.GetUserDataUseCase(gh<_i1006.AccountRepoInterface>()),
    );
    gh.factory<_i357.UpdateUserDataUseCase>(
      () => _i357.UpdateUserDataUseCase(gh<_i1006.AccountRepoInterface>()),
    );
    gh.factory<_i265.AccountCubit>(
      () => _i265.AccountCubit(
        gh<_i842.GetUserDataUseCase>(),
        gh<_i357.UpdateUserDataUseCase>(),
      ),
    );
    return this;
  }
}
