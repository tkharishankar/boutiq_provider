part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class AddProductReq extends ProductEvent {
  final String name;
  final String identifier;
  final String price;
  final String deliveryPrice;
  final String description;
  final List<XFile> images;

  const AddProductReq({
    required this.name,
    required this.identifier,
    required this.price,
    required this.deliveryPrice,
    required this.description,
    required this.images,
  });
}

class GetProducts extends ProductEvent {
  final String providerID;

  const GetProducts({required this.providerID});
}

class ProductSize extends ProductEvent {
  final String sizeName;
  final String price;
  final String quantity;

  const ProductSize({
    required this.sizeName,
    required this.price,
    required this.quantity,
  });
}
