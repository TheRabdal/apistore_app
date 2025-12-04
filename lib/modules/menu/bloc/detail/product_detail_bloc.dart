import 'package:apistore_app/packages/packages.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchProductDetail extends ProductDetailEvent {
  final String productId;

  const FetchProductDetail(this.productId);

  @override
  List<Object> get props => [productId];
}

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final Product product;

  const ProductDetailLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductDetailError extends ProductDetailState {
  final String message;

  const ProductDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ApiService apiService;

  ProductDetailBloc(this.apiService) : super(ProductDetailInitial()) {
    on<FetchProductDetail>(_onFetchProductDetail);
  }

  Future<void> _onFetchProductDetail(
    FetchProductDetail event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(ProductDetailLoading());
    try {
      final product = await apiService.getProductById(event.productId);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}