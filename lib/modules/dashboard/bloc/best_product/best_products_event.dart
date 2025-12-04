part of 'best_products_bloc.dart';

abstract class BestProductsEvent extends Equatable {
  const BestProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchBestProducts extends BestProductsEvent {}
