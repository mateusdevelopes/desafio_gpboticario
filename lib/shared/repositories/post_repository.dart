import 'package:desafio_gpboticario/shared/interfaces/i_post_repository.dart';
import 'package:desafio_gpboticario/shared/models/post_model.dart';
import 'package:desafio_gpboticario/shared/services/rest_client.dart';
import 'package:desafio_gpboticario/shared/services/rest_exception.dart';
import 'package:dio/dio.dart';

class PostRepository extends IPostRepository {
  final Dio _dio = Dio(restClient.options);

  @override
  Future<List<PostModel>> fetchPaginatedPosts(
      int page, int limit, String orderBy, String order) async {
    var queryParams = {
      "page": page,
      "limit": "10",
      "orderBy": orderBy,
      "order": order
    };
    try {
      final response = await _dio.get('/posts', queryParameters: queryParams);
      return response.data
              .map<PostModel>((e) => PostModel.fromJson(e))
              .toList() ??
          [];
    } on DioError catch (e) {
      if (e.response?.statusCode == 500) {
        print('Houve um problema no servidor!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      throw RestException(
          message: e.error, statusCode: e.response?.statusCode ?? 0);
    }
  }

  @override
  Future createPost(String createdAt, String userId, String description,
      String name, String avatar) async {
    var body = {
      "userId": userId,
      "createdAt": createdAt,
      "name": name,
      "avatar": avatar,
      "description": description,
    };
    try {
      final response = await _dio.post('/posts', data: body);
      print(response.statusCode);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print('Registro não encontrado!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      } else if (e.response?.statusCode == 500) {
        print('Houve um problema no servidor!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      throw RestException(
          message: e.error, statusCode: e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<PostModel> deletePost(String id) async {
    try {
      final response = await _dio.delete('/posts/$id');
      return PostModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print('Registro não encontrado!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      } else if (e.response?.statusCode == 500) {
        print('Houve um problema no servidor!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      throw RestException(
          message: e.error, statusCode: e.response?.statusCode ?? 0);
    }
  }

  @override
  Future<PostModel> editPost(String id, String description) async {
    var body = {"description": description};
    try {
      final response = await _dio.put('/posts/$id', data: body);
      return PostModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        print('Registro não encontrado!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      } else if (e.response?.statusCode == 500) {
        print('Houve um problema no servidor!');
        throw RestException(
            message: 'Houve um problema no servidor!',
            statusCode: e.response?.statusCode ?? 0);
      }
      throw RestException(
          message: e.error, statusCode: e.response?.statusCode ?? 0);
    }
  }
}
