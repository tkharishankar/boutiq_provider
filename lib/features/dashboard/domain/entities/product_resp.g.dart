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
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      price: json['price'] as String? ?? '',
      deliveryPrice: json['deliveryPrice'] as String? ?? '',
      subCategory: json['subCategory'] as String? ?? '',
      subCategoryType: json['subCategoryType'] as String? ?? '',
      description: json['description'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'price': instance.price,
      'deliveryPrice': instance.deliveryPrice,
      'subCategory': instance.subCategory,
      'subCategoryType': instance.subCategoryType,
      'description': instance.description,
      'tags': instance.tags,
      'imageUrls': instance.imageUrls,
    };
