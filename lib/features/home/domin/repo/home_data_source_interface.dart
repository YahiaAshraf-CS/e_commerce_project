import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/domin/entities/categories_list_entity.dart';
import 'package:e_commerce/features/home/domin/entities/categories_list_entity.dart';
import 'package:e_commerce/features/home/domin/entities/product_list_entity.dart';

abstract class HomeDataSourceInterface {
  Future<ApiResult<CategoriesListEntity>> getAllCategories();
  Future<ApiResult<ProductListEntity>> getAllProducts();
}
