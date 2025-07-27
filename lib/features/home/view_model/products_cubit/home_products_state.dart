part of 'home_products_cubit.dart';

@immutable
abstract class HomeProductsState {}

class HomeProductsInitial extends HomeProductsState {}

class HomeProductsLoading extends HomeProductsState {}

class HomeProductsSuccess extends HomeProductsState {}

class HomeProductsError extends HomeProductsState {
  final String message;
  HomeProductsError(this.message);
}
