import 'package:desafio_gpboticario/shared/interfaces/i_post_repository.dart';
import 'package:desafio_gpboticario/shared/models/post_model.dart';

class PostRepository extends IPostRepository {
  @override
  Future<List<PostModel>> fetchPaginatedPosts() {
    // TODO: implement fetchPaginatedPosts
    throw UnimplementedError();
  }

  @override
  Future<PostModel> deletePost(String id, PostModel postModel) {
    // TODO: implement deletePost
    var body = {
      "createdAt": DateTime.now(),
      "name": postModel.name,
      "avatar": postModel.avatar,
      "description": postModel.description,
    };
    throw UnimplementedError();
  }

  @override
  Future<PostModel> editPost(String id, PostModel postModel) {
    // TODO: implement editPost
    var body = {
      "createdAt": DateTime.now(),
      "name": postModel.name,
      "avatar": postModel.avatar,
      "description": postModel.description,
      "userId": postModel.userId
    };
    throw UnimplementedError();
  }
}
