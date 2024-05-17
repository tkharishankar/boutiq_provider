// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddProductRespImpl _$$AddProductRespImplFromJson(Map<String, dynamic> json) =>
    _$AddProductRespImpl(
      message: json['message'] ?? '',
    );

Map<String, dynamic> _$$AddProductRespImplToJson(
        _$AddProductRespImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['productId'] as String? ?? '',
      providerId: json['providerId'] as String? ?? '',
      category: json['category'] as String? ?? '',
      deliveryPrice: json['deliveryPrice'] as String? ?? '',
      description: json['description'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: json['price'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      subCategoryType: json['subCategoryType'] as String? ?? '',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      currency: json['currency'] as String? ?? 'INR',
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      updatedAt: (json['updatedAt'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'providerId': instance.providerId,
      'category': instance.category,
      'deliveryPrice': instance.deliveryPrice,
      'description': instance.description,
      'name': instance.name,
      'price': instance.price,
      'subCategory': instance.subCategory,
      'subCategoryType': instance.subCategoryType,
      'imageUrls': instance.imageUrls,
      'currency': instance.currency,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$ProductSizeImpl _$$ProductSizeImplFromJson(Map<String, dynamic> json) =>
    _$ProductSizeImpl(
      sizeId: json['sizeId'] as String? ?? '',
      productId: json['productId'] as String? ?? '',
      productSize: json['productSize'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      selectedQuantity: (json['selectedQuantity'] as num?)?.toInt() ?? 0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ProductSizeImplToJson(_$ProductSizeImpl instance) =>
    <String, dynamic>{
      'sizeId': instance.sizeId,
      'productId': instance.productId,
      'productSize': instance.productSize,
      'quantity': instance.quantity,
      'selectedQuantity': instance.selectedQuantity,
      'price': instance.price,
    };

_$ProductDetailRespImpl _$$ProductDetailRespImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDetailRespImpl(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productSize: (json['productSize'] as List<dynamic>)
          .map((e) => ProductSize.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductDetailRespImplToJson(
        _$ProductDetailRespImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'productSize': instance.productSize,
    };
