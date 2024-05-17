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
