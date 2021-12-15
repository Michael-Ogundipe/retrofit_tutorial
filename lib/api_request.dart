import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_request.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/posts")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("")
  Future<List<FetchPost>> getPost();
}

@JsonSerializable()
class FetchPost {
  int userId;
  int id;
  String title;
  String body;

  FetchPost({required this.userId, required this.id, required this.title, required this.body});

  factory FetchPost.fromJson(Map<String, dynamic> json) => _$FetchPostFromJson(json);
  Map<String, dynamic> toJson() => _$FetchPostToJson(this);
}


//>flutter pub run build_runner build
