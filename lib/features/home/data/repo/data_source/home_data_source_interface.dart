import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/data/model/categories_list_model.dart';

abstract class HomeDataSourceInterface {
  Future<ApiResult<CategoriesList>> getAllCategories();
}
