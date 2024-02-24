// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String? id;
  String? name;
  String? description;
  double? price;
  double? rating;
  int? stock;
  String? thumbnail;
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.rating,
    this.stock,
    this.thumbnail,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? rating,
    int? stock,
    String? thumbnail,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'rating': rating,
      'stock': stock,
      'thumbnail': thumbnail,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      stock: map['stock'] != null ? map['stock'] as int : null,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, rating: $rating, stock: $stock, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.price == price &&
      other.rating == rating &&
      other.stock == stock &&
      other.thumbnail == thumbnail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      rating.hashCode ^
      stock.hashCode ^
      thumbnail.hashCode;
  }
}
