 import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/domin/entities/product_list_entity.dart';
import 'package:e_commerce/features/home/domin/repo/home_repo_interface.dart';

class GetAllProductsUserCase {
  final HomeRepoInterface homeRepoInterface;

  GetAllProductsUserCase(this.homeRepoInterface);
  Future<ApiResult<ProductListEntity>> invoke() async =>
      await homeRepoInterface.getAllProducts();
}