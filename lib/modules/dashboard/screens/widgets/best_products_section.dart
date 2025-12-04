import 'package:apistore_app/packages/packages.dart';

class BestProductsSection extends StatelessWidget {
  const BestProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Produk Terbaik',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        BlocProvider(
          create: (context) =>
              BestProductsBloc(ApiService())..add(FetchBestProducts()),
          child: BlocBuilder<BestProductsBloc, BestProductsState>(
            builder: (context, state) {
              if (state is BestProductsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BestProductsLoaded) {
                return DashboardList(data: state.products);
              } else if (state is BestProductsError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

