import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:desafio_gpboticario/ui/make_post/make_post_controller.dart';
import 'package:desafio_gpboticario/ui/widgets/app_bar_widget.dart';
import 'package:desafio_gpboticario/ui/widgets/elegant_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class MakePostPage extends GetView<MakePostController> {
  final postId;
  final description;
  MakePostPage({this.postId = "", this.description = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(
        title: "Novo Post",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => ElegantTextInputWidget(
                  text: "O que está acontecendo?",
                  maxLength: 280,
                  maxLines: 14,
                  controller: controller.description,
                  counterText: "${controller.textCounter.value} / 280",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RoundedLoadingButton(
                color: DesignColors.COLOR_BLUE,
                elevation: 0,
                controller: controller.button,
                child: Text(
                  "PUBLICAR POST",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  controller.createNewPost(postId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
