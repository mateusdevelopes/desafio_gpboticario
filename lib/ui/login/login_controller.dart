import 'dart:async';

import 'package:desafio_gpboticario/shared/repositories/news_repository.dart';
import 'package:desafio_gpboticario/shared/repositories/post_repository.dart';
import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:desafio_gpboticario/shared/utils/snack_bars.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  // final IAuthRepository _authRepository;
  // LoginController(this._authRepository);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final SnackBars _snack = SnackBars();
  final GetStorage _box = GetStorage();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RoundedLoadingButtonController button =
      RoundedLoadingButtonController();
  RxBool isVisiblePassword = false.obs;
  RxBool get isVisible => isVisiblePassword;

  doLogin(_) async {
    //TODO: RETIRAR ATRIBUIÇÕES APOS FINALIZAR MANUTENÇÃO
    email.text = "emerson@gmail.com";
    password.text = "@Abc123";
    try {
      if (email.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo do E-mail!');
      } else if (!EmailValidator.validate(email.text)) {
        _snack.errorSnackbar(msg: 'Informe um  E-mail valido!');
      } else if (password.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo da Senha!');
        button.stop();
      } else if (password.text.length < 6) {
        _snack.errorSnackbar(
            msg: "A senha precisa ter mais do que 6 caracteres!");
        button.stop();
      } else {
        // var response =
        // await _authRepository.userLogin(email.text, password.text);
        button.stop();
        // _box.write("token", response.data.accessToken);
        // _box.write("userType", "driver");
        Get.offNamed(AppRouters.FEED);
        _snack.successSnackbar(msg: "Login realizado com sucesso!");
      }
      button.stop();
    } on Exception catch (e) {
      button.stop();
      print(e.toString().split("Exception: "));
      _snack.errorSnackbar(msg: e.toString());
    }
  }

  final NewsRepository _repository = NewsRepository();
  final PostRepository _repositoryP = PostRepository();

  getNews() async {
    try {
      var res = await _repository.fetchNews();
      print(res);
    } catch (e) {
      Completer().completeError(e);
      print(e);
    }
  }

  getPosts() async {
    try {
      var res =
          await _repositoryP.fetchPaginatedPosts(1, 10, "createdAt", "desc");
      print(res);
    } catch (e) {
      Completer().completeError(e);
      print(e);
    }
  }

  setVisible() => isVisiblePassword.toggle();
}
