// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get addressName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String? addressName,
      String? name,
      String? mobileNumber,
      String? label,
      String? address});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = freezed,
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? label = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? addressName,
      String? name,
      String? mobileNumber,
      String? label,
      String? address});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressName = freezed,
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? label = freezed,
    Object? address = freezed,
  }) {
    return _then(_$AddressImpl(
      addressName: freezed == addressName
          ? _value.addressName
          : addressName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {this.addressName,
      this.name,
      this.mobileNumber,
      this.label,
      this.address});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? addressName;
  @override
  final String? name;
  @override
  final String? mobileNumber;
  @override
  final String? label;
  @override
  final String? address;

  @override
  String toString() {
    return 'Address(addressName: $addressName, name: $name, mobileNumber: $mobileNumber, label: $label, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.addressName, addressName) ||
                other.addressName == addressName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, addressName, name, mobileNumber, label, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {final String? addressName,
      final String? name,
      final String? mobileNumber,
      final String? label,
      final String? address}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get addressName;
  @override
  String? get name;
  @override
  String? get mobileNumber;
  @override
  String? get label;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentData _$PaymentDataFromJson(Map<String, dynamic> json) {
  return _PaymentData.fromJson(json);
}

/// @nodoc
mixin _$PaymentData {
  String? get transactionId => throw _privateConstructorUsedError;
  int? get totalAmount => throw _privateConstructorUsedError;
  int? get deliveryFee => throw _privateConstructorUsedError;
  int? get subTotalAmount => throw _privateConstructorUsedError;
  String? get paymentState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDataCopyWith<PaymentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDataCopyWith<$Res> {
  factory $PaymentDataCopyWith(
          PaymentData value, $Res Function(PaymentData) then) =
      _$PaymentDataCopyWithImpl<$Res, PaymentData>;
  @useResult
  $Res call(
      {String? transactionId,
      int? totalAmount,
      int? deliveryFee,
      int? subTotalAmount,
      String? paymentState});
}

/// @nodoc
class _$PaymentDataCopyWithImpl<$Res, $Val extends PaymentData>
    implements $PaymentDataCopyWith<$Res> {
  _$PaymentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? totalAmount = freezed,
    Object? deliveryFee = freezed,
    Object? subTotalAmount = freezed,
    Object? paymentState = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as int?,
      subTotalAmount: freezed == subTotalAmount
          ? _value.subTotalAmount
          : subTotalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentState: freezed == paymentState
          ? _value.paymentState
          : paymentState // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDataImplCopyWith<$Res>
    implements $PaymentDataCopyWith<$Res> {
  factory _$$PaymentDataImplCopyWith(
          _$PaymentDataImpl value, $Res Function(_$PaymentDataImpl) then) =
      __$$PaymentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? transactionId,
      int? totalAmount,
      int? deliveryFee,
      int? subTotalAmount,
      String? paymentState});
}

/// @nodoc
class __$$PaymentDataImplCopyWithImpl<$Res>
    extends _$PaymentDataCopyWithImpl<$Res, _$PaymentDataImpl>
    implements _$$PaymentDataImplCopyWith<$Res> {
  __$$PaymentDataImplCopyWithImpl(
      _$PaymentDataImpl _value, $Res Function(_$PaymentDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? totalAmount = freezed,
    Object? deliveryFee = freezed,
    Object? subTotalAmount = freezed,
    Object? paymentState = freezed,
  }) {
    return _then(_$PaymentDataImpl(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryFee: freezed == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as int?,
      subTotalAmount: freezed == subTotalAmount
          ? _value.subTotalAmount
          : subTotalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentState: freezed == paymentState
          ? _value.paymentState
          : paymentState // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDataImpl implements _PaymentData {
  const _$PaymentDataImpl(
      {this.transactionId,
      this.totalAmount,
      this.deliveryFee,
      this.subTotalAmount,
      this.paymentState});

  factory _$PaymentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDataImplFromJson(json);

  @override
  final String? transactionId;
  @override
  final int? totalAmount;
  @override
  final int? deliveryFee;
  @override
  final int? subTotalAmount;
  @override
  final String? paymentState;

  @override
  String toString() {
    return 'PaymentData(transactionId: $transactionId, totalAmount: $totalAmount, deliveryFee: $deliveryFee, subTotalAmount: $subTotalAmount, paymentState: $paymentState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDataImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.subTotalAmount, subTotalAmount) ||
                other.subTotalAmount == subTotalAmount) &&
            (identical(other.paymentState, paymentState) ||
                other.paymentState == paymentState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, totalAmount,
      deliveryFee, subTotalAmount, paymentState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      __$$PaymentDataImplCopyWithImpl<_$PaymentDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentData implements PaymentData {
  const factory _PaymentData(
      {final String? transactionId,
      final int? totalAmount,
      final int? deliveryFee,
      final int? subTotalAmount,
      final String? paymentState}) = _$PaymentDataImpl;

  factory _PaymentData.fromJson(Map<String, dynamic> json) =
      _$PaymentDataImpl.fromJson;

  @override
  String? get transactionId;
  @override
  int? get totalAmount;
  @override
  int? get deliveryFee;
  @override
  int? get subTotalAmount;
  @override
  String? get paymentState;
  @override
  @JsonKey(ignore: true)
  _$$PaymentDataImplCopyWith<_$PaymentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) {
  return _ProductItem.fromJson(json);
}

/// @nodoc
mixin _$ProductItem {
  String? get productId => throw _privateConstructorUsedError;
  String? get providerId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get productSize => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get totalAmount => throw _privateConstructorUsedError;
  int? get deliveryPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemCopyWith<ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemCopyWith<$Res> {
  factory $ProductItemCopyWith(
          ProductItem value, $Res Function(ProductItem) then) =
      _$ProductItemCopyWithImpl<$Res, ProductItem>;
  @useResult
  $Res call(
      {String? productId,
      String? providerId,
      String? name,
      String? imageUrl,
      int? quantity,
      String? productSize,
      double? price,
      int? totalAmount,
      int? deliveryPrice});
}

/// @nodoc
class _$ProductItemCopyWithImpl<$Res, $Val extends ProductItem>
    implements $ProductItemCopyWith<$Res> {
  _$ProductItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? providerId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? quantity = freezed,
    Object? productSize = freezed,
    Object? price = freezed,
    Object? totalAmount = freezed,
    Object? deliveryPrice = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      productSize: freezed == productSize
          ? _value.productSize
          : productSize // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryPrice: freezed == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductItemImplCopyWith<$Res>
    implements $ProductItemCopyWith<$Res> {
  factory _$$ProductItemImplCopyWith(
          _$ProductItemImpl value, $Res Function(_$ProductItemImpl) then) =
      __$$ProductItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? productId,
      String? providerId,
      String? name,
      String? imageUrl,
      int? quantity,
      String? productSize,
      double? price,
      int? totalAmount,
      int? deliveryPrice});
}

/// @nodoc
class __$$ProductItemImplCopyWithImpl<$Res>
    extends _$ProductItemCopyWithImpl<$Res, _$ProductItemImpl>
    implements _$$ProductItemImplCopyWith<$Res> {
  __$$ProductItemImplCopyWithImpl(
      _$ProductItemImpl _value, $Res Function(_$ProductItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
    Object? providerId = freezed,
    Object? name = freezed,
    Object? imageUrl = freezed,
    Object? quantity = freezed,
    Object? productSize = freezed,
    Object? price = freezed,
    Object? totalAmount = freezed,
    Object? deliveryPrice = freezed,
  }) {
    return _then(_$ProductItemImpl(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      productSize: freezed == productSize
          ? _value.productSize
          : productSize // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryPrice: freezed == deliveryPrice
          ? _value.deliveryPrice
          : deliveryPrice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductItemImpl implements _ProductItem {
  const _$ProductItemImpl(
      {this.productId,
      this.providerId,
      this.name,
      this.imageUrl,
      this.quantity,
      this.productSize,
      this.price,
      this.totalAmount,
      this.deliveryPrice});

  factory _$ProductItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductItemImplFromJson(json);

  @override
  final String? productId;
  @override
  final String? providerId;
  @override
  final String? name;
  @override
  final String? imageUrl;
  @override
  final int? quantity;
  @override
  final String? productSize;
  @override
  final double? price;
  @override
  final int? totalAmount;
  @override
  final int? deliveryPrice;

  @override
  String toString() {
    return 'ProductItem(productId: $productId, providerId: $providerId, name: $name, imageUrl: $imageUrl, quantity: $quantity, productSize: $productSize, price: $price, totalAmount: $totalAmount, deliveryPrice: $deliveryPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productSize, productSize) ||
                other.productSize == productSize) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.deliveryPrice, deliveryPrice) ||
                other.deliveryPrice == deliveryPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, providerId, name,
      imageUrl, quantity, productSize, price, totalAmount, deliveryPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemImplCopyWith<_$ProductItemImpl> get copyWith =>
      __$$ProductItemImplCopyWithImpl<_$ProductItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductItemImplToJson(
      this,
    );
  }
}

abstract class _ProductItem implements ProductItem {
  const factory _ProductItem(
      {final String? productId,
      final String? providerId,
      final String? name,
      final String? imageUrl,
      final int? quantity,
      final String? productSize,
      final double? price,
      final int? totalAmount,
      final int? deliveryPrice}) = _$ProductItemImpl;

  factory _ProductItem.fromJson(Map<String, dynamic> json) =
      _$ProductItemImpl.fromJson;

  @override
  String? get productId;
  @override
  String? get providerId;
  @override
  String? get name;
  @override
  String? get imageUrl;
  @override
  int? get quantity;
  @override
  String? get productSize;
  @override
  double? get price;
  @override
  int? get totalAmount;
  @override
  int? get deliveryPrice;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemImplCopyWith<_$ProductItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) {
  return _OrderSummary.fromJson(json);
}

/// @nodoc
mixin _$OrderSummary {
  String? get customerId => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get providerId => throw _privateConstructorUsedError;
  OrderStatus? get status => throw _privateConstructorUsedError;
  PaymentData? get paymentData => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  List<ProductItem?>? get productItems => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderSummaryCopyWith<OrderSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryCopyWith<$Res> {
  factory $OrderSummaryCopyWith(
          OrderSummary value, $Res Function(OrderSummary) then) =
      _$OrderSummaryCopyWithImpl<$Res, OrderSummary>;
  @useResult
  $Res call(
      {String? customerId,
      String? orderId,
      String? providerId,
      OrderStatus? status,
      PaymentData? paymentData,
      Address? address,
      List<ProductItem?>? productItems,
      int? updatedAt});

  $PaymentDataCopyWith<$Res>? get paymentData;
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res, $Val extends OrderSummary>
    implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? orderId = freezed,
    Object? providerId = freezed,
    Object? status = freezed,
    Object? paymentData = freezed,
    Object? address = freezed,
    Object? productItems = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      paymentData: freezed == paymentData
          ? _value.paymentData
          : paymentData // ignore: cast_nullable_to_non_nullable
              as PaymentData?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      productItems: freezed == productItems
          ? _value.productItems
          : productItems // ignore: cast_nullable_to_non_nullable
              as List<ProductItem?>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentDataCopyWith<$Res>? get paymentData {
    if (_value.paymentData == null) {
      return null;
    }

    return $PaymentDataCopyWith<$Res>(_value.paymentData!, (value) {
      return _then(_value.copyWith(paymentData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderSummaryImplCopyWith<$Res>
    implements $OrderSummaryCopyWith<$Res> {
  factory _$$OrderSummaryImplCopyWith(
          _$OrderSummaryImpl value, $Res Function(_$OrderSummaryImpl) then) =
      __$$OrderSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? customerId,
      String? orderId,
      String? providerId,
      OrderStatus? status,
      PaymentData? paymentData,
      Address? address,
      List<ProductItem?>? productItems,
      int? updatedAt});

  @override
  $PaymentDataCopyWith<$Res>? get paymentData;
  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$OrderSummaryImplCopyWithImpl<$Res>
    extends _$OrderSummaryCopyWithImpl<$Res, _$OrderSummaryImpl>
    implements _$$OrderSummaryImplCopyWith<$Res> {
  __$$OrderSummaryImplCopyWithImpl(
      _$OrderSummaryImpl _value, $Res Function(_$OrderSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? orderId = freezed,
    Object? providerId = freezed,
    Object? status = freezed,
    Object? paymentData = freezed,
    Object? address = freezed,
    Object? productItems = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$OrderSummaryImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: freezed == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus?,
      paymentData: freezed == paymentData
          ? _value.paymentData
          : paymentData // ignore: cast_nullable_to_non_nullable
              as PaymentData?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      productItems: freezed == productItems
          ? _value._productItems
          : productItems // ignore: cast_nullable_to_non_nullable
              as List<ProductItem?>?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderSummaryImpl implements _OrderSummary {
  const _$OrderSummaryImpl(
      {this.customerId,
      this.orderId,
      this.providerId,
      this.status,
      this.paymentData,
      this.address,
      final List<ProductItem?>? productItems,
      this.updatedAt})
      : _productItems = productItems;

  factory _$OrderSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSummaryImplFromJson(json);

  @override
  final String? customerId;
  @override
  final String? orderId;
  @override
  final String? providerId;
  @override
  final OrderStatus? status;
  @override
  final PaymentData? paymentData;
  @override
  final Address? address;
  final List<ProductItem?>? _productItems;
  @override
  List<ProductItem?>? get productItems {
    final value = _productItems;
    if (value == null) return null;
    if (_productItems is EqualUnmodifiableListView) return _productItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'OrderSummary(customerId: $customerId, orderId: $orderId, providerId: $providerId, status: $status, paymentData: $paymentData, address: $address, productItems: $productItems, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentData, paymentData) ||
                other.paymentData == paymentData) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._productItems, _productItems) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      orderId,
      providerId,
      status,
      paymentData,
      address,
      const DeepCollectionEquality().hash(_productItems),
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryImplCopyWith<_$OrderSummaryImpl> get copyWith =>
      __$$OrderSummaryImplCopyWithImpl<_$OrderSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSummaryImplToJson(
      this,
    );
  }
}

abstract class _OrderSummary implements OrderSummary {
  const factory _OrderSummary(
      {final String? customerId,
      final String? orderId,
      final String? providerId,
      final OrderStatus? status,
      final PaymentData? paymentData,
      final Address? address,
      final List<ProductItem?>? productItems,
      final int? updatedAt}) = _$OrderSummaryImpl;

  factory _OrderSummary.fromJson(Map<String, dynamic> json) =
      _$OrderSummaryImpl.fromJson;

  @override
  String? get customerId;
  @override
  String? get orderId;
  @override
  String? get providerId;
  @override
  OrderStatus? get status;
  @override
  PaymentData? get paymentData;
  @override
  Address? get address;
  @override
  List<ProductItem?>? get productItems;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$OrderSummaryImplCopyWith<_$OrderSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderStatusTrace _$OrderStatusTraceFromJson(Map<String, dynamic> json) {
  return _OrderStatusTrace.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusTrace {
  String get orderId => throw _privateConstructorUsedError;
  OrderStatus get orderStatus => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusTraceCopyWith<OrderStatusTrace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusTraceCopyWith<$Res> {
  factory $OrderStatusTraceCopyWith(
          OrderStatusTrace value, $Res Function(OrderStatusTrace) then) =
      _$OrderStatusTraceCopyWithImpl<$Res, OrderStatusTrace>;
  @useResult
  $Res call({String orderId, OrderStatus orderStatus, int timestamp});
}

/// @nodoc
class _$OrderStatusTraceCopyWithImpl<$Res, $Val extends OrderStatusTrace>
    implements $OrderStatusTraceCopyWith<$Res> {
  _$OrderStatusTraceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderStatus = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatusTraceImplCopyWith<$Res>
    implements $OrderStatusTraceCopyWith<$Res> {
  factory _$$OrderStatusTraceImplCopyWith(_$OrderStatusTraceImpl value,
          $Res Function(_$OrderStatusTraceImpl) then) =
      __$$OrderStatusTraceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId, OrderStatus orderStatus, int timestamp});
}

/// @nodoc
class __$$OrderStatusTraceImplCopyWithImpl<$Res>
    extends _$OrderStatusTraceCopyWithImpl<$Res, _$OrderStatusTraceImpl>
    implements _$$OrderStatusTraceImplCopyWith<$Res> {
  __$$OrderStatusTraceImplCopyWithImpl(_$OrderStatusTraceImpl _value,
      $Res Function(_$OrderStatusTraceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? orderStatus = null,
    Object? timestamp = null,
  }) {
    return _then(_$OrderStatusTraceImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusTraceImpl implements _OrderStatusTrace {
  const _$OrderStatusTraceImpl(
      {required this.orderId,
      required this.orderStatus,
      required this.timestamp});

  factory _$OrderStatusTraceImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusTraceImplFromJson(json);

  @override
  final String orderId;
  @override
  final OrderStatus orderStatus;
  @override
  final int timestamp;

  @override
  String toString() {
    return 'OrderStatusTrace(orderId: $orderId, orderStatus: $orderStatus, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusTraceImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, orderStatus, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusTraceImplCopyWith<_$OrderStatusTraceImpl> get copyWith =>
      __$$OrderStatusTraceImplCopyWithImpl<_$OrderStatusTraceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusTraceImplToJson(
      this,
    );
  }
}

abstract class _OrderStatusTrace implements OrderStatusTrace {
  const factory _OrderStatusTrace(
      {required final String orderId,
      required final OrderStatus orderStatus,
      required final int timestamp}) = _$OrderStatusTraceImpl;

  factory _OrderStatusTrace.fromJson(Map<String, dynamic> json) =
      _$OrderStatusTraceImpl.fromJson;

  @override
  String get orderId;
  @override
  OrderStatus get orderStatus;
  @override
  int get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$OrderStatusTraceImplCopyWith<_$OrderStatusTraceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
