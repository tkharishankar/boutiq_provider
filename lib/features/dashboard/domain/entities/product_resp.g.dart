// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddProductResp _$$_AddProductRespFromJson(Map<String, dynamic> json) =>
    _$_AddProductResp(
      message: json['message'] ?? '',
    );

Map<String, dynamic> _$$_AddProductRespToJson(_$_AddProductResp instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
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
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'price': instance.price,
      'deliveryPrice': instance.deliveryPrice,
      'subCategory': instance.subCategory,
      'subCategoryType': instance.subCategoryType,
      'description': instance.description,
      'tags': instance.tags,
      'images': instance.images,
    };
