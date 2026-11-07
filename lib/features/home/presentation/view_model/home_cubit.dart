import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/network/api_result.dart';
import 'package:e_commerce/features/home/data/model/categories_list_model.dart';
import 'package:e_commerce/features/home/data/repo/repo/home_repo_interface.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit( this.repo) : super(HomeInitial());
  final HomeRepoInterface repo;

  Future<void> getAllCategories() async {
    emit(HCLoading());
    final result = await repo.getAllCategories();
    switch (result) {
      case ApiSuccess<CategoriesList>():
        emit(HCSuccess( categoriesList: result.data.list!));
      case ApiError():
        emit(HCError(result.message));
    }
  }
}
