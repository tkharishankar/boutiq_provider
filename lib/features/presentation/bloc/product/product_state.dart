part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.addProductError(String message) = _AddProductError;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.addProductSuccessful(String message) =
      _AddProductSuccessful;

  const factory ProductState.onProductList(List<Product> products) = _OnLoaded;

  const factory ProductState.onProductListError(String message) =
      _OnProductListError;

  const factory ProductState.onProductDetail(ProductDetailResp product) =
      _onProductDetail;

  const factory ProductState.onProductDetailError(String message) =
      _onProductDetailError;

  const factory ProductState.onProductDetailLoading() =
      _onProductDetailLoading;
}
