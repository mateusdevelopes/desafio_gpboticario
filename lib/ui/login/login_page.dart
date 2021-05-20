import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:desafio_gpboticario/ui/login/login_controller.dart';
import 'package:desafio_gpboticario/ui/widgets/app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COR_GREEN,
      appBar: AppBarWidget(),
      body: Container(
        height: context.height,
        width: context.width,
        margin: EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Entrar",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Informe seu e-mail",
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          counterText: "",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(10)),
                      child: Obx(
                        () => TextFormField(
                          controller: controller.password,
                          obscureText: !controller.isVisiblePassword.value,
                          decoration: InputDecoration(
                            hintText: "Informe sua Senha",
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.setVisible();
                              },
                              child: new Icon(controller.isVisiblePassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: RoundedLoadingButton(
                      color: Color(0xff232D40),
                      elevation: 0,
                      borderRadius: 10,
                      controller: controller.button,
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        controller.doLogin(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: MaterialButton(
                      child: Text("GET NEWS"),
                      onPressed: () {
                        controller.getNews();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: MaterialButton(
                      child: Text("GET POSTS"),
                      onPressed: () {
                        controller.getPosts();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
