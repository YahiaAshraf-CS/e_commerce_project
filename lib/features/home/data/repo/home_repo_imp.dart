import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/domin/entities/categories_list_entity.dart';
import 'package:e_commerce/features/home/domin/entities/product_list_entity.dart';
import 'package:e_commerce/features/home/domin/repo/home_data_source_interface.dart';
import 'package:e_commerce/features/home/domin/repo/home_repo_interface.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepoInterface)
class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface homeDataSource;

  HomeRepoImp(this.homeDataSource);

  @override
  Future<ApiResult<CategoriesListEntity>> getAllCategories() async =>
      await homeDataSource.getAllCategories();

  @override
  Future<ApiResult<ProductListEntity>> getAllProducts() async =>
      await homeDataSource.getAllProducts();
}
