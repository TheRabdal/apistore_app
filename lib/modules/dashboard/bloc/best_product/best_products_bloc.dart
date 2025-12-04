import 'package:apistore_app/packages/packages.dart';

part 'best_products_event.dart';
part 'best_products_state.dart';

class BestProductsBloc extends Bloc<BestProductsEvent, BestProductsState> {
  final ApiService _apiService;

  BestProductsBloc(this._apiService) : super(BestProductsInitial()) {
    on<FetchBestProducts>((event, emit) async {
      emit(BestProductsLoading());
      try {
        final products = await _apiService.getProducts();
        products.sort(
          (a, b) => (b.rating?.rate ?? 0).compareTo(a.rating?.rate ?? 0),
        );
        final bestProducts = products.take(5).toList();
        emit(BestProductsLoaded(bestProducts));
      } catch (e) {
        emit(BestProductsError(e.toString()));
      }
    });
  }
}
