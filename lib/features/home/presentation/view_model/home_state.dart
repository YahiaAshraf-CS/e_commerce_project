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
  final List<CategoryModel> categoriesList;
  HCSuccess({required this.categoriesList});
}
