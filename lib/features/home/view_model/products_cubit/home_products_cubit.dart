import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:marketi/core/data/remote_data/api_home_data.dart';
import 'package:marketi/features/home/model/response/get_products.dart';
import 'package:meta/meta.dart';
part 'home_products_state.dart';

class HomeProductsCubit extends Cubit<HomeProductsState> {
  HomeProductsCubit() : super(HomeProductsInitial());
  List<ProductItem> products = [];
  Future<void> getHomeProducts() async {
    emit(HomeProductsLoading());
    try {
      var response = await ApiHomeData.getProducts();
      products = response.list ?? [];
      log(products.toString());
      log(products.length.toString());
      log(response.toString());
      emit(HomeProductsSuccess());
    } catch (e) {
      emit(HomeProductsError(e.toString()));
    }
  }
}
