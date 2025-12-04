part of 'best_products_bloc.dart';

abstract class BestProductsState extends Equatable {
  const BestProductsState();

  @override
  List<Object> get props => [];
}

class BestProductsInitial extends BestProductsState {}

class BestProductsLoading extends BestProductsState {}

class BestProductsLoaded extends BestProductsState {
  final List<Product> products;

  const BestProductsLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class BestProductsError extends BestProductsState {
  final String message;

  const BestProductsError(this.message);

  @override
  List<Object> get props => [message];
}
