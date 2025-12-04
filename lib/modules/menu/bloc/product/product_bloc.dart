import 'package:apistore_app/packages/packages.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ApiService _apiService;

  ProductBloc(this._apiService) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await _apiService.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        String errorMessage = 'Terjadi kesalahan tidak dikenal.';
        if (e is Exception) {
          errorMessage = e.toString().replaceFirst('Exception: ', '');
        }
        emit(ProductError(errorMessage));
      }
    });
  }
}
