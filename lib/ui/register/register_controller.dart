import 'package:desafio_gpboticario/shared/repositories/auth_repository.dart';
import 'package:desafio_gpboticario/shared/utils/snack_bars.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterController extends GetxController {
  final SnackBars _snack = SnackBars();
  final GetStorage _box = GetStorage();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final RoundedLoadingButtonController button =
      RoundedLoadingButtonController();
  final AuthRepository _repository = AuthRepository();
  RxBool isVisiblePassword = false.obs;
  RxBool get isVisible => isVisiblePassword;

  setVisible() => isVisiblePassword.toggle();

  doRegister() async {
    try {
      if (name.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo do Nome!');
      } else if (email.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo do E-mail!');
      } else if (!EmailValidator.validate(email.text)) {
        _snack.errorSnackbar(msg: 'Informe um  E-mail valido!');
      } else if (password.text.isEmpty) {
        _snack.errorSnackbar(msg: 'Preencha o campo da Senha!');
      } else if (password.text.length < 6) {
        _snack.errorSnackbar(
            msg: "A senha precisa ter mais do que 6 caracteres!");
      } else if (password.text != confirmPassword.text) {
        _snack.errorSnackbar(msg: "A senha confirmada não é a mesma!");
      } else {
        var response = await _repository.registerUser(
            DateTime.now().toString(), name.text, email.text, password.text);
        // _box.write("token", response.fakeToken);
        // _box.write("userId", response.id);
        Get.back();
        button.stop();
        _snack.successSnackbar(msg: "Registro realizado com sucesso!");
      }
      button.stop();
    } catch (e) {
      button.stop();
      _snack.errorSnackbar(msg: e.toString());
    }
  }
}
