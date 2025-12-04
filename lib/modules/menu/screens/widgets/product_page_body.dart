import 'package:apistore_app/packages/packages.dart';

class ProductPageBody extends StatelessWidget {
  const ProductPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ApiService())..add(FetchProducts()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return const Center(child: Text('Tidak ada produk tersedia.'));
            }
            return ProductList(products: state.products);
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Selamat Datang di Halaman Produk!'));
        },
      ),
    );
  }
}
