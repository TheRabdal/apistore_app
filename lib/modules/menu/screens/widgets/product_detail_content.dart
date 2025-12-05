import 'package:apistore_app/packages/packages.dart';

class ProductDetailContent extends StatelessWidget {
  final Product product;

  const ProductDetailContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.image ?? 'https://via.placeholder.com/150'),
          const SizedBox(height: 16.0),
          Text(
            product.title ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            '\$${(product.price ?? 0.0).toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, color: Colors.green),
          ),
          const SizedBox(height: 8.0),
          Text(
            product.category ?? '',
            style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16.0),
          Text(product.description ?? '', style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8.0),
          if (product.rating != null)
            Text(
              'Rating: ${product.rating!.rate} (${product.rating!.count} reviews)',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
