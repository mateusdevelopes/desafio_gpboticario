import 'package:desafio_gpboticario/shared/models/post_model.dart';

abstract class IPostRepository {
  Future<List<PostModel>> fetchPaginatedPosts(
      int page, int limit, String orderBy, String order);

  Future<PostModel> createPost(
      int userId, String description, String name, String avatar);

  Future<PostModel> editPost(
      String id, String description, PostModel postModel);

  Future<PostModel> deletePost(String id);
}
