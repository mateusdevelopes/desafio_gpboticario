import 'package:desafio_gpboticario/shared/models/post_model.dart';

abstract class IPostRepository {
  Future<List<PostModel>> fetchPaginatedPosts();

  Future<PostModel> editPost(String id, PostModel postModel);

  Future<PostModel> deletePost(String id, PostModel postModel);
}
