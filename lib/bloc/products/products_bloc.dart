import 'package:bloc/bloc.dart';
import '../../model/product.dart';
import '../../repository/product_repository.dart';
import '../../utils/enums.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductRepository productRepository = ProductRepository();
  List<Product> temProductsList = [];

  ProductsBloc() : super(const ProductsState()) {
    on<FetchProducts>(_fetchProductApi);
    on<SearchProducts>(_searchProducts);
  }

  void _fetchProductApi(FetchProducts event, Emitter<ProductsState> emit) async {
    await productRepository.fetchProducts().then((val) {
      emit(state.copyWith(status: Status.success, responseMessage: 'Success', productsList: val));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: Status.failure, responseMessage: error.toString()));
      print(error);
      print(stackTrace);
    });
  }

  void _searchProducts(SearchProducts event, Emitter<ProductsState> emit) async {
    if (event.searchString.isEmpty) {
      emit(state.copyWith(temProductsList: [],searchMessage: ''));
    } else {
      temProductsList = state.productsList.where((element) => element.name.toString().toLowerCase().contains(event.searchString.toLowerCase())).toList();
      if (temProductsList.isEmpty) {
        emit(state.copyWith(temProductsList: temProductsList,searchMessage: 'No data found'));
      } else {
        emit(state.copyWith(temProductsList: temProductsList,searchMessage: ''));
      }
    }
  }
}
