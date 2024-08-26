import 'package:bloc/bloc.dart';
import '../../repository/product_repository.dart';
import '../../utils/enums.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductRepository productRepository = ProductRepository();

  ProductsBloc() : super(const ProductsState()) {
    on<FetchProducts>(fetchProductApi);
  }

  void fetchProductApi(FetchProducts event, Emitter<ProductsState> emit) async {
    await productRepository.fetchProducts().then((val) {
      emit(state.copyWith(status: Status.success, responseMessage: 'Success', productsList: val));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: Status.failure, responseMessage: error.toString()));
      print(error);
      print(stackTrace);
    });
  }
}
