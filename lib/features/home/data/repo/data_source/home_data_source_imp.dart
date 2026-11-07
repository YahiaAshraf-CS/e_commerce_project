
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/data/api/home_api.dart';
import 'package:e_commerce/features/home/data/model/categories_list_model.dart';
import 'package:e_commerce/features/home/data/repo/data_source/home_data_source_interface.dart';

class HomeDataSourceImp implements HomeDataSourceInterface {
  @override
  Future<ApiResult<CategoriesList>> getAllCategories() async =>
   HomeApi.getAllCategories();
  
  
}