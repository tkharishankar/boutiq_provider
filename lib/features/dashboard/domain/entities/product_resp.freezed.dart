// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_resp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddProductResp _$AddProductRespFromJson(Map<String, dynamic> json) {
  return _AddProductResp.fromJson(json);
}

/// @nodoc
mixin _$AddProductResp {
  dynamic get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddProductRespCopyWith<AddProductResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProductRespCopyWith<$Res> {
  factory $AddProductRespCopyWith(
          AddProductResp value, $Res Function(AddProductResp) then) =
      _$AddProductRespCopyWithImpl<$Res, AddProductResp>;
  @useResult
  $Res call({dynamic message});
}

/// @nodoc
class _$AddProductRespCopyWithImpl<$Res, $Val extends AddProductResp>
    implements $AddProductRespCopyWith<$Res> {
  _$AddProductRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddProductRespImplCopyWith<$Res>
    implements $AddProductRespCopyWith<$Res> {
  factory _$$AddProductRespImplCopyWith(_$AddProductRespImpl value,
          $Res Function(_$AddProductRespImpl) then) =
      __$$AddProductRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic message});
}

/// @nodoc
class __$$AddProductRespImplCopyWithImpl<$Res>
    extends _$AddProductRespCopyWithImpl<$Res, _$AddProductRespImpl>
    implements _$$AddProductRespImplCopyWith<$Res> {
  __$$AddProductRespImplCopyWithImpl(
      _$AddProductRespImpl _value, $Res Function(_$AddProductRespImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$AddProductRespImpl(
      message: freezed == message ? _value.message! : message,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddProductRespImpl implements _AddProductResp {
  const _$AddProductRespImpl({this.message = ''});

  factory _$AddProductRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddProductRespImplFromJson(json);

  @override
  @JsonKey()
  final dynamic message;

  @override
  String toString() {
    return 'AddProductResp(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProductRespImpl &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductRespImplCopyWith<_$AddProductRespImpl> get copyWith =>
      __$$AddProductRespImplCopyWithImpl<_$AddProductRespImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddProductRespImplToJson(
      this,
    );
  }
}

abstract class _AddProductResp implements AddProductResp {
  const factory _AddProductResp({final dynamic message}) = _$AddProductRespImpl;

  factory _AddProductResp.fromJson(Map<String, dynamic> json) =
      _$AddProductRespImpl.fromJson;

  @override
  dynamic get message;
  @override
  @JsonKey(ignore: true)
  _$$AddProductRespImplCopyWith<_$AddProductRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get name => throw _privateConstructorUsedError; // Add @required here
  String get category => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get deliveryPrice => throw _privateConstructorUsedError;
  String get subCategory => throw _privateConstructorUsedError;
  String get subCategoryType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String name,
      String category,
      String price,
      String deliveryPrice,
      String subCategory,
      String subCategoryType,
      String description,
      List<String> tags,
      List<String> imageUrls});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? price = null,
    Object? deliveryPrice = null,
    Object? subCategory = null,
    Object? subCategoryType = null,
    Object? description = null,
    Object? tags = null,
    Object? imageUrls = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPrice: null == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryType: null == subCategoryType
          ? _value.subCategoryType
          : subCategoryType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String category,
      String price,
      String deliveryPrice,
      String subCategory,
      String subCategoryType,
      String description,
      List<String> tags,
      List<String> imageUrls});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? price = null,
    Object? deliveryPrice = null,
    Object? subCategory = null,
    Object? subCategoryType = null,
    Object? description = null,
    Object? tags = null,
    Object? imageUrls = null,
  }) {
    return _then(_$ProductImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryPrice: null == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryType: null == subCategoryType
          ? _value.subCategoryType
          : subCategoryType // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {this.name = '',
      this.category = '',
      this.price = '',
      this.deliveryPrice = '',
      this.subCategory = '',
      this.subCategoryType = '',
      this.description = '',
      final List<String> tags = const [],
      final List<String> imageUrls = const []})
      : _tags = tags,
        _imageUrls = imageUrls;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey()
  final String name;
// Add @required here
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final String deliveryPrice;
  @override
  @JsonKey()
  final String subCategory;
  @override
  @JsonKey()
  final String subCategoryType;
  @override
  @JsonKey()
  final String description;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  String toString() {
    return 'Product(name: $name, category: $category, price: $price, deliveryPrice: $deliveryPrice, subCategory: $subCategory, subCategoryType: $subCategoryType, description: $description, tags: $tags, imageUrls: $imageUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.deliveryPrice, deliveryPrice) ||
                other.deliveryPrice == deliveryPrice) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.subCategoryType, subCategoryType) ||
                other.subCategoryType == subCategoryType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      category,
      price,
      deliveryPrice,
      subCategory,
      subCategoryType,
      description,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_imageUrls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {final String name,
      final String category,
      final String price,
      final String deliveryPrice,
      final String subCategory,
      final String subCategoryType,
      final String description,
      final List<String> tags,
      final List<String> imageUrls}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get name;
  @override // Add @required here
  String get category;
  @override
  String get price;
  @override
  String get deliveryPrice;
  @override
  String get subCategory;
  @override
  String get subCategoryType;
  @override
  String get description;
  @override
  List<String> get tags;
  @override
  List<String> get imageUrls;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
