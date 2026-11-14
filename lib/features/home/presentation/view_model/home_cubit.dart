import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/domin/entities/categories_list_entity.dart';
import 'package:e_commerce/features/home/domin/entities/product_list_entity.dart';
import 'package:e_commerce/features/home/domin/repo/home_repo_interface.dart';
import 'package:e_commerce/features/home/domin/use_case/get_all_categories_user_case.dart';
import 'package:e_commerce/features/home/domin/use_case/get_all_products_user_case.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getAllCategoriesUseCase, this.getAllProductsUseCase) : super(HomeInitial());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetAllProductsUserCase getAllProductsUseCase;
  Future<void> getAllCategories() async {
    emit(HCLoading());
    final result = await getAllCategoriesUseCase.invoke();
    if (isClosed) return;
    switch (result) {
      case ApiSuccess<CategoriesListEntity>():
        emit(HCSuccess(categoriesList: result.data.list));
      case ApiError():
        emit(HCError(result.message));
    }
  }

  Future<void> getAllProducts() async {
    emit(HPLoading());
    final result = await getAllProductsUseCase.invoke();
    switch (result) {
      case ApiSuccess<ProductListEntity>():
        emit(
          HPSuccess(
            productList: result.data.list, //error may
          ),
        );
      case ApiError():
        emit(HPError(result.message));
    }
  }
}
