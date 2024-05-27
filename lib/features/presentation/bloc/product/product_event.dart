part of 'product_bloc.dart';

class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class AddProduct extends ProductEvent {
  final String name;
  final String identifier;
  final String price;
  final String description;
  final List<XFile> images;
  final List<String> imageStorageUrl;

  const AddProduct({
    required this.name,
    required this.identifier,
    required this.price,
    required this.description,
    required this.images,
    required this.imageStorageUrl,
  });
}

class AddProductSize extends ProductEvent {
  final String productId;
  final List<ProductSize> productSizes;

  const AddProductSize({
    required this.productId,
    required this.productSizes,
  });
}

class UpdateProductReq extends ProductEvent {
  final String productId;
  final String name;
  final String identifier;
  final String price;
  final String description;
  final List<XFile> images;

  const UpdateProductReq({
    required this.productId,
    required this.name,
    required this.identifier,
    required this.price,
    required this.description,
    required this.images,
  });
}

class GetProducts extends ProductEvent {

  const GetProducts();
}

class GetProductDetail extends ProductEvent {
  final String productId;

  const GetProductDetail({required this.productId});
}
