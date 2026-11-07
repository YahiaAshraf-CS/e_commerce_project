import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/domin/entities/categories_list_entity.dart';
import 'package:e_commerce/features/home/domin/repo/home_repo_interface.dart';

class GetAllCategoriesUseCase {
  final HomeRepoInterface _homeRepoInterface;

  GetAllCategoriesUseCase(this._homeRepoInterface);
  Future<ApiResult<CategoriesListEntity>> invoke() async =>
     await _homeRepoInterface.getAllCategories();
  
}
