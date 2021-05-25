import 'package:desafio_gpboticario/shared/models/post_model.dart';

abstract class IPostRepository {
  Future<List<PostModel>> fetchPaginatedPosts(
      int page, int limit, String orderBy, String order);

  Future createPost(String createdAt, String userId, String description,
      String name, String avatar);

  Future<PostModel> editPost(String id, String description);

  Future<PostModel> deletePost(String id);
}
