import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/data/api/home_api.dart';
import 'package:e_commerce/features/home/data/model/categories_list_model.dart';
import 'package:e_commerce/features/home/data/model/product_list_model.dart';
import 'package:e_commerce/features/home/domin/entities/categories_list_entity.dart';
import 'package:e_commerce/features/home/domin/entities/product_list_entity.dart';
import 'package:e_commerce/features/home/domin/repo/home_data_source_interface.dart';

class HomeDataSourceImp implements HomeDataSourceInterface {
 
 @override
  Future<ApiResult<CategoriesListEntity>> getAllCategories() async {
    final result = await HomeApi.getAllCategories();
    switch (result) {
      case ApiSuccess<CategoriesListDto>():
        final dto = result.data;
        return ApiSuccess<CategoriesListEntity>(
          CategoriesListEntity(
            list:
                dto.list?.map((e) => CategoryEntity(e.slug ?? "", e.name ?? "")).toList() ??
                [],
          ),
        );
      case ApiError<CategoriesListDto>():
        return ApiError<CategoriesListEntity>(result.message);
    }
  }
 
  @override
  Future<ApiResult<ProductListEntity>> getAllProducts() async {
    final result = await HomeApi.getAllProducts();
    switch (result) {
      case ApiSuccess<ProductListDto>():
        final dto = result.data;
        return ApiSuccess<ProductListEntity>(
          ProductListEntity(
            dto.list
                    ?.map(
                      (e) => ProductEntity(
                        id: e.id ?? 0,
                        title: e.title ?? "",
                        description: e.description ?? "",
                        category: e.category ?? "",
                        price: (e.price ?? 0).toDouble(),
                        discountPercentage: (e.discountPercentage ?? 0)
                            .toDouble(),
                        rating: (e.rating ?? 0).toDouble(),
                        stock: e.stock ?? 0,
                        images: List<String>.from(e.images ?? []),
                      ),
                    )
                    .toList() ??
                [],
            dto.total ?? 0,
            dto.skip ?? 0,
            dto.limit ?? 0,
          ),
        );
      case ApiError<ProductListDto>():
        return ApiError<ProductListEntity>(result.message);
    }
  }
}
