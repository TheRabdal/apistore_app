import 'package:apistore_app/packages/packages.dart';

class ProductDetailPage extends StatelessWidget {
  final String productId;

  const ProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailBloc(ApiService())..add(FetchProductDetail(productId)),
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return Scaffold(
              appBar: AppBar(title: const Text('Product Detail')),
              body: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is ProductDetailError) {
            return Scaffold(
              appBar: AppBar(title: const Text('Product Detail')),
              body: Center(child: Text(state.message)),
            );
          } else if (state is ProductDetailLoaded) {
            final Product product = state.product;
            return Scaffold(
              appBar: AppBar(title: Text(product.title)),
              body: ProductDetailContent(product: product),
            );
          }
          return Scaffold(
            appBar: AppBar(title: const Text('Product Detail')),
            body: const Center(
              child: Text('Product not found or initial state.'),
            ),
          );
        },
      ),
    );
  }
}
