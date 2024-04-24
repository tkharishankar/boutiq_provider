
import 'package:boutiq_provider/features/auth/domain/entities/registration_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';


@RestApi(baseUrl: "http://boutiq-stage-db4d05bbf88e.herokuapp.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("api/v1/provider/register")
  Future<HttpResponse<RegisterResponse>> providerRegistration(@Body() Map<String, dynamic> body);

}