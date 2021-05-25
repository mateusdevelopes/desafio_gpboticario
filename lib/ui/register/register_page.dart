import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:desafio_gpboticario/ui/register/register_controller.dart';
import 'package:desafio_gpboticario/ui/widgets/app_bar_widget.dart';
import 'package:desafio_gpboticario/ui/widgets/elegant_password_input_field.dart';
import 'package:desafio_gpboticario/ui/widgets/elegant_text_input.dart';
import 'package:desafio_gpboticario/ui/widgets/section_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(),
      body: Container(
        width: context.width,
        height: context.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SectionTextWidget(
                  text: 'CADASTRO',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElegantTextInputWidget(
                  text: 'Nome ',
                  textInputType: TextInputType.emailAddress,
                  controller: controller.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElegantTextInputWidget(
                  text: 'E-mail',
                  textInputType: TextInputType.emailAddress,
                  controller: controller.email,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Obx(
                  () => ElegantPasswordInputWidget(
                    text: 'Senha',
                    controller: controller.password,
                    isObscureText: !controller.isVisiblePassword.value,
                    onTap: () {
                      controller.setVisible();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Obx(
                  () => ElegantTextInputWidget(
                    text: 'Confirmar Senha',
                    controller: controller.confirmPassword,
                    obscureText: !controller.isVisiblePassword.value,
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: RoundedLoadingButton(
                  color: DesignColors.COLOR_BLUE,
                  elevation: 0,
                  controller: controller.button,
                  child: Text(
                    "FINALIZAR CADASTRO",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller.doRegister();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
