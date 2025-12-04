import 'package:apistore_app/packages/packages.dart';

class ApiService {
  final String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> getProducts() async {
    final response = await DioLogger.instance.get('$_baseUrl/products');

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = response.data;
      return jsonList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to load products, Status Code: ${response.statusCode}',
      );
    }
  }

  Future<Product> getProductById(String id) async {
    final response = await DioLogger.instance.get('$_baseUrl/products/$id');

    if (response.statusCode == 200) {
      final data = Product.fromJson(response.data);
      return data;
    } else if (response.statusCode == 404) {
      throw Exception('Product with ID $id not found.');
    } else {
      throw Exception(
        'Failed to load product with ID $id, Status Code: ${response.statusCode}',
      );
    }
  }
}
