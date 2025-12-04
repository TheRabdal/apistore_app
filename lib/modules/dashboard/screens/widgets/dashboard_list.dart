import 'package:apistore_app/packages/packages.dart';

class DashboardList extends StatelessWidget {
  const DashboardList({super.key, required this.data});
  final List<Product> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final product = data[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-detail',
                arguments: product.id.toString(),
              );
            },
            child: ProductItem(product: product),
          );
        },
      ),
    );
  }
}
