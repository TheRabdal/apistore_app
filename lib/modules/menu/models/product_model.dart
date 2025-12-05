import 'package:apistore_app/packages/packages.dart';

class Product extends Equatable {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num?)?.toDouble(),
      description: json["description"],
      category: json["category"],
      image: json["image"],
      rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    );
  }

  @override
  String toString() {
    return "$id, $title, $price, $description, $category, $image, $rating, ";
  }

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    description,
    category,
    image,
    rating,
  ];
}

class Rating extends Equatable {
  Rating({required this.rate, required this.count});

  final double? rate;
  final int? count;

  Rating copyWith({double? rate, int? count}) {
    return Rating(rate: rate ?? this.rate, count: count ?? this.count);
  }

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: (json["rate"] as num?)?.toDouble(),
      count: (json["count"] as num?)?.toInt(),
    );
  }

  @override
  String toString() {
    return "$rate, $count, ";
  }

  @override
  List<Object?> get props => [rate, count];
}
