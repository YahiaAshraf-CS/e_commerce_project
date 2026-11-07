import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/data/model/categories_list_model.dart';
import 'package:e_commerce/features/home/data/repo/data_source/home_data_source_interface.dart';
import 'package:e_commerce/features/home/data/repo/repo/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface homeDataSource;

  HomeRepoImp( this.homeDataSource);

  @override
  Future<ApiResult<CategoriesList>> getAllCategories() async =>
   await homeDataSource.getAllCategories();
  
}
