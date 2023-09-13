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
  final String category;
  final String price;
  final String deliveryPrice;
  final String subCategory;
  final String subCategoryType;
  final String description;
  final List<String> tags;
  final List<XFile> images;

  const AddProductReq({
    required this.name,
    required this.identifier,
    required this.category,
    required this.price,
    required this.deliveryPrice,
    required this.subCategory,
    required this.subCategoryType,
    required this.description,
    required this.tags,
    required this.images,
  });
}

class GetProducts extends ProductEvent{}
