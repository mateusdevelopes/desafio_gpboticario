import 'package:desafio_gpboticario/shared/repositories/auth_repository.dart';
import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:desafio_gpboticario/shared/services/rest_exception.dart';
import 'package:desafio_gpboticario/shared/utils/snack_bars.dart';
import 'package:desafio_gpboticario/ui/dash/dash_binding.dart';
import 'package:desafio_gpboticario/ui/dash/dash_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  final SnackBars _snack = SnackBars();
  final GetStorage _box = GetStorage();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  RoundedLoadingButtonController loginButton = RoundedLoadingButtonController();
  RoundedLoadingButtonController registerButton =
      RoundedLoadingButtonController();
  final AuthRepository _repository = AuthRepository();
  RxBool isVisiblePassword = false.obs;
  RxBool get isVisible => isVisiblePassword;

  doLogin() async {
    try {
      if (email.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo do E-mail!');
        loginButton.stop();
      } else if (!EmailValidator.validate(email.text)) {
        _snack.errorSnackbar(msg: 'Informe um  E-mail valido!');
        loginButton.stop();
      } else if (password.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo da Senha!');
        loginButton.stop();
      } else if (password.text.length < 6) {
        _snack.errorSnackbar(
            msg: "A senha precisa ter mais do que 6 caracteres!");
        loginButton.stop();
      } else {
        var response = await _repository.fakeLogin(email.text, password.text);
        _box.write("token", response.fakeToken);
        /** USADO fakeToken PARA IDENTIFICAR MELHOR no mockapi o resultado, 
         * espeficia ainda melhor na consulta. O ideal seria usar o id de usuário;
         */
        _box.write("userId", response.fakeToken);
        _box.write("name", response.user);
        _box.write("avatar", response.avatar);
        Get.off(DashPage(), binding: DashBinding());
        loginButton.stop();
        _snack.successSnackbar(msg: "Login realizado com sucesso!");
      }
      loginButton.stop();
    } on RestException catch (e) {
      loginButton.stop();
      _snack.errorSnackbar(msg: e.toString());
    }
  }

  goToRegister() {
    Get.toNamed(AppRouters.REGISTER);
    registerButton.stop();
  }

  setVisible() => isVisiblePassword.toggle();
}
