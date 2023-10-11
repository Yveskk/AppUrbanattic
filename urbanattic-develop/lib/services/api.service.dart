import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:urbanattic/model/attic_model.dart';

part 'api.service.g.dart';

final Dio dioClient = Dio(BaseOptions(
    headers: {"URBA0085TG028": " "},
    baseUrl: 'https://localhost:3000'));
final RestAPI apiClient = RestAPI(dioClient);

@RestApi()
abstract class RestAPI {
  factory RestAPI(Dio dio, {String baseUrl}) = _RestAPI;

  @GET('/attic/{id}')
  Future<List<Attic>> getUserNotifications(
      @Path("id") String id);

 
}