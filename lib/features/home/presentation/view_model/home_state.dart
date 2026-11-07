part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HCLoading extends HomeState {}

final class HCError extends HomeState {
  final String messageError;
  HCError(this.messageError);
}

final class HCSuccess extends HomeState {
  final List<CategoryEntity> categoriesList;

  HCSuccess({required this.categoriesList});
}

final class HPLoading extends HomeState {}

final class HPError extends HomeState {
  final String messageError;
  HPError(this.messageError);
}

final class HPSuccess extends HomeState {
  final List<ProductEntity> productList;
  HPSuccess({required this.productList});
}
