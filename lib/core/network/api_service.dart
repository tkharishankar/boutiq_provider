
import 'package:boutiq_provider/features/data/models/login/login_response.dart';
import 'package:boutiq_provider/features/data/models/registration/registration_response.dart';
import 'package:boutiq_provider/features/data/models/product/product_resp.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';


@RestApi(baseUrl: "http://boutiq-stage-db4d05bbf88e.herokuapp.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("api/v1/provider/register")
  Future<HttpResponse<RegisterResponse>> providerRegistration(@Body() Map<String, dynamic> body);

  @POST("api/v1/provider/login")
  Future<HttpResponse<LoginResponse>> providerLogin(@Body() Map<String, dynamic> body);

  @GET("api/v1/providers")
  Future<HttpResponse<LoginResponse>> getProviderList();

  @GET('api/v1/product/{providerID}')
  Future<HttpResponse<List<Product>>> getProviderProductsList(@Path('providerID') String providerID);

}