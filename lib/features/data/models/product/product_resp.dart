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
    @Default('') String productId,
    @Default('') String providerId,
    @Default('') String category,
    @Default('') String deliveryPrice,
    @Default('') String description,
    @Default('') String name,
    @Default('') String price,
    @Default('') String subCategory,
    @Default('') String subCategoryType,
    @Default(<String>[]) List<String> imageUrls,
    @Default('INR') String currency,
    @Default(0) int createdAt,
    @Default(0) int updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}