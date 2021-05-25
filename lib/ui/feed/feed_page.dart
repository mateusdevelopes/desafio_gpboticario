import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:desafio_gpboticario/shared/models/post_model.dart';
import 'package:desafio_gpboticario/shared/routers/app_routes.dart';
import 'package:desafio_gpboticario/ui/feed/feed_controller.dart';
import 'package:desafio_gpboticario/ui/widgets/app_bar_widget.dart';
import 'package:desafio_gpboticario/ui/widgets/post_item.dart';
import 'package:desafio_gpboticario/ui/widgets/section_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FeedPage extends GetView<FeedController> {
  final GetStorage _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(
        title: "Feed de Posts",
        // leading: IconButton(
        //   icon: Icon(
        //     CupertinoIcons.refresh,
        //     color: DesignColors.COLOR_ORANGE,
        //   ),
        //   onPressed: () {},
        // ),
        actions: [
          !controller.checkPlatform()
              ? IconButton(
                  color: DesignColors.COLOR_ORANGE,
                  icon: Icon(CupertinoIcons.add),
                  onPressed: () {
                    Get.toNamed(AppRouters.MAKE_POST);
                  },
                )
              : Container()
        ],
      ),
      body: Container(
        height: context.height,
        width: context.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 10, bottom: 10),
                child: SectionTextWidget(
                  text: 'Postagens recentes',
                  fontSize: 26,
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Container(
                  height: context.height,
                  child: PagedListView<int, PostModel>(
                    pagingController: controller.pagingController,
                    physics: BouncingScrollPhysics(),
                    builderDelegate: PagedChildBuilderDelegate<PostModel>(
                      itemBuilder: (_, item, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: PostItemWidget(
                          width: Get.width,
                          userId: item.userId,
                          userName: item.name,
                          postDate: item.createdAt,
                          postDescription: item.description,
                          imageAvatarUrl: item.avatar,
                          onOptionsTap: () {
                            Get.dialog(AlertDialog(
                                title: SectionTextWidget(
                                  text: "Informe o que você deseja",
                                  fontSize: 12,
                                  textScale: 1.2,
                                ),
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: DesignColors.COLOR_LIGHT_GREY,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextButton(
                                          child: Text(
                                            'Editar',
                                            style: TextStyle(
                                                color: DesignColors.COLOR_BLUE),
                                          ),
                                          onPressed: () {
                                            controller.goToEditPost(
                                                item.id, item.description);
                                          },
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: DesignColors.COLOR_LIGHT_GREY,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: TextButton(
                                          child: Text(
                                            'Deletar',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          onPressed: () {
                                            controller.deletePost(item.id);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: controller.checkPlatform()
          ? FloatingActionButton(
              backgroundColor: DesignColors.COLOR_ORANGE,
              child: Icon(Icons.add),
              onPressed: () {
                Get.toNamed(AppRouters.MAKE_POST);
              },
            )
          : Container(),
    );
  }
}
