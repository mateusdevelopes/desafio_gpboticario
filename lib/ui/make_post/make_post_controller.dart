import 'package:desafio_gpboticario/shared/repositories/post_repository.dart';
import 'package:desafio_gpboticario/shared/services/rest_exception.dart';
import 'package:desafio_gpboticario/shared/utils/snack_bars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class MakePostController extends GetxController {
  final SnackBars _snack = SnackBars();
  final GetStorage _box = GetStorage();
  final TextEditingController description = TextEditingController();
  final RoundedLoadingButtonController button =
      RoundedLoadingButtonController();
  final PostRepository _repository = PostRepository();
  final arguments = Get.arguments;
  var textCounter = 0.obs;
  var postId = 0.obs;

  @override
  void onInit() {
    description.addListener(_countTextFieldLength);
    description.text = arguments;
    super.onInit();
  }

  @override
  void dispose() {
    description.dispose();
    super.dispose();
  }

  createNewPost(String id) async {
    if (description.text.isEmpty) {
      makeNewPost();
    } else {
      editExistentPost(id, description.text);
    }
  }

  makeNewPost() async {
    var userId = _box.read("userId");
    var name = _box.read("name");
    var avatar = _box.read("avatar");
    try {
      if (description.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Este campo não pode ser vazio!');
        button.stop();
      } else {
        var response = await _repository.createPost(
            defineDateTime(), userId, description.text, name, avatar);
        print(response);
        Get.back();
        button.stop();
        _snack.successSnackbar(msg: 'Seu post foi publicado com sucesso!');
      }
      button.stop();
    } on RestException catch (e) {
      button.stop();
      _snack.errorSnackbar(msg: e.toString());
    }
  }

  editExistentPost(String postId, String text) async {
    try {
      if (description.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Este campo não pode ser vazio!');
        button.stop();
      } else {
        var response = await _repository.editPost(postId, text);
        print(response);
        Get.back();
        button.stop();
        _snack.successSnackbar(msg: 'Seu post foi publicado com sucesso!');
      }
      button.stop();
    } on RestException catch (e) {
      button.stop();
      _snack.errorSnackbar(msg: e.toString());
    }
  }

  defineDateTime() {
    DateTime now = DateTime.now();
    String convertedDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}T${now.hour.toString()}:${now.minute.toString()}:${now.second.toString()}Z";
    return convertedDateTime;
  }

  _countTextFieldLength() => textCounter.value = description.text.length;
}
