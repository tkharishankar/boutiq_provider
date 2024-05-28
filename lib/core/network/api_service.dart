import 'package:boutiq_provider/features/data/models/deliverycharge/delivery_charge.dart';
import 'package:boutiq_provider/features/data/models/login/login_response.dart';
import 'package:boutiq_provider/features/data/models/order/order_summary.dart';
import 'package:boutiq_provider/features/data/models/product/product_resp.dart';
import 'package:boutiq_provider/features/data/models/provider/order_dashboard_resp.dart';
import 'package:boutiq_provider/features/data/models/registration/registration_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://boutiq-stage-db4d05bbf88e.herokuapp.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("api/v1/providers/register")
  Future<HttpResponse<RegisterResponse>> providerRegistration(
      @Body() Map<String, dynamic> body);

  @POST("api/v1/providers/login")
  Future<HttpResponse<LoginResponse>> providerLogin(
      @Body() Map<String, dynamic> body);

  @GET("api/v1/providers")
  Future<HttpResponse<LoginResponse>> getProviderList();

  @GET('api/v1/products/{providerId}')
  Future<HttpResponse<List<Product>>> getProviderProductsList(
      @Path('providerId') String providerId);

  @GET('api/v1/orders/provider/{providerId}')
  Future<HttpResponse<List<Product>>> getProviderOrdersList(
      @Path('providerId') String providerId);

  @GET('api/v1/orders/orderStatus/{orderId}')
  Future<HttpResponse<List<OrderStatusTrace>>> getOrderStatusTraces(
      @Path('orderId') String orderId);

  @POST('api/v1/orders/update-status/{orderId}')
  Future<HttpResponse<String>> updateOrderStatus(
    @Path('orderId') String orderId,
    @Body() OrderStatusUpdateReq req,
  );

  @GET('api/v1/products/detail/{productId}')
  Future<HttpResponse<Product>> getProductDetail(
      @Path('productId') String productId);

  @GET('api/v1/providers/delivery-charge/{providerId}')
  Future<HttpResponse<List<Region>>> getRegionList(
      @Path('providerId') String providerId);

  @POST('api/v1/providers/delivery-charge/{providerId}')
  Future<HttpResponse<String>> updateDeliveryCharges(
    @Path('providerId') String providerId,
    @Body() DeliveryChargeReq req,
  );

  @POST('api/v1/products')
  Future<HttpResponse<AddProductResp>> addProduct(
      @Header('providerId') String providerId,
      @Body() AddProductReq addProductReq);

  @POST('api/v1/products/{productId}/sizes')
  Future<HttpResponse<AddProductResp>> addProductSize(
      @Header('providerId') String providerId,
      @Path('productId') String productId,
      @Body() List<ProductSize> productSizes);

  @GET('api/v1/providers/order-summary-detail')
  Future<HttpResponse<OrderDashboardResp>> getDashboardDetails(
      @Header('providerId') String providerId);

  @GET('api/v1/providers/{providerId}')
  Future<HttpResponse<Provider>> getGetProviderDetail(
      @Path('providerId') String providerId);
}
