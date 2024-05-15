import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_resp.freezed.dart';
part 'product_resp.g.dart';

@freezed
class AddProductResp with _$AddProductResp {
  const factory AddProductResp({@Default('') message}) = _AddProductResp;

  factory AddProductResp.fromJson(Map<String, dynamic> json) =>
      _$AddProductRespFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @Default('') String name, // Add @required here
    @Default('') String category,
    @Default('') String price,
    @Default('') String deliveryPrice,
    @Default('') String subCategory,
    @Default('') String subCategoryType,
    @Default('') String description,
    @Default([]) List<String> tags,
    @Default([]) List<String> imageUrls,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Product(
      name: data['name'] ?? '',
      category: data['category'] ?? '',
      price: data['price'] ?? '',
      deliveryPrice: data['deliveryPrice'] ?? '',
      subCategory: data['subCategory'] ?? '',
      subCategoryType: data['subCategoryType'] ?? '',
      description: data['description'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
    );
  }
}
