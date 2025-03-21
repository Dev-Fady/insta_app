import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: "https://social-api4.p.rapidapi.com/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("info")
  Future<dynamic> getUserInfo(
    @Query("username_or_id_or_url") String username,
    @Header("x-rapidapi-host") String host,
    @Header("x-rapidapi-key") String apiKey,
  );
  @GET("posts")
  Future<dynamic> getPosts(
    @Query("username_or_id_or_url") String username,
    @Header("x-rapidapi-host") String host,
    @Header("x-rapidapi-key") String apiKey,
  );
}
