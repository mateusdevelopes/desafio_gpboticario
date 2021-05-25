import 'dart:async';
import 'dart:io';
import 'package:desafio_gpboticario/shared/models/post_model.dart';
import 'package:desafio_gpboticario/shared/repositories/post_repository.dart';
import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:desafio_gpboticario/shared/services/rest_exception.dart';
import 'package:desafio_gpboticario/shared/utils/snack_bars.dart';
import 'package:desafio_gpboticario/ui/make_post/make_post_binding.dart';
import 'package:desafio_gpboticario/ui/make_post/make_post_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedController extends GetxController {
  final GetStorage _box = GetStorage();
  final SnackBars _snack = SnackBars();
  final PostRepository _repository = PostRepository();
  final PagingController<int, PostModel> pagingController =
      PagingController(firstPageKey: 1);
  var isLoading = true.obs;
  var supplyList = List<PostModel>.empty().obs;
  static const pageSize = 10;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      getPaginatedPosts(pageKey);
    });
    super.onInit();
  }

  bool checkPlatform() {
    if (Platform.isAndroid) {
      return true;
    }
    return false;
  }

  Future getPaginatedPosts(int pageKey) async {
    try {
      var response =
          await _repository.fetchPaginatedPosts(pageKey, 10, "id", "desc");
      final isLastPage = response.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(response);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(response, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
      _snack.wanningSnackbar(msg: error);
    }
  }

  Future deletePost(String postId) async {
    try {
      var response = await _repository.deletePost(postId);
      Get.back();
      _snack.successSnackbar(msg: "Seu Post foi deletado!");
      return response;
    } on RestException catch (e) {
      _snack.errorSnackbar(msg: e.message);
      print(e);
    }
  }

  goToEditPost(String postId, String description) async {
    Get.to(MakePostPage(postId: postId, description: description),
        binding: MakePostBinding(), arguments: description);
  }
}
