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
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedPage extends GetView<FeedController> {
  final GetStorage _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(
        title: "Feed de Posts",
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
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(
          waterDropColor: DesignColors.COLOR_ORANGE,
        ),
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        child: Container(
          height: Get.height,
          width: Get.width,
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
                flex: 13,
                child: FutureBuilder<List<PostModel>>(
                  future: controller.fetchPost(),
                  builder: (context, snapshot) {
                    // WHILE THE CALL IS BEING MADE LOADING
                    if (ConnectionState.active != null && !snapshot.hasData) {
                      // return Center(child: CircularProgressIndicator());
                      return controller.checkPlatform()
                          ? Center(child: CircularProgressIndicator())
                          : Center(child: CupertinoActivityIndicator());
                    }
                    // WHEN THE CALL IS DONE BUT HAPPENS TO HAVE AN ERROR
                    if (ConnectionState.done != null && snapshot.hasError) {
                      return Center(child: Text(snapshot.error));
                    }
                    // IF IT WORKS IT GOES HERE!
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: PostItemWidget(
                            width: Get.width,
                            userId: snapshot.data[index].userId,
                            userName: snapshot.data[index].name,
                            postDate: snapshot.data[index].createdAt,
                            postDescription: snapshot.data[index].description,
                            imageAvatarUrl: snapshot.data[index].avatar,
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
                                            color:
                                                DesignColors.COLOR_LIGHT_GREY,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: TextButton(
                                            child: Text(
                                              'Editar',
                                              style: TextStyle(
                                                  color:
                                                      DesignColors.COLOR_BLUE),
                                            ),
                                            onPressed: () {
                                              controller.goToEditPost(
                                                  snapshot.data[index].id,
                                                  snapshot
                                                      .data[index].description);
                                            },
                                          ),
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                DesignColors.COLOR_LIGHT_GREY,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: TextButton(
                                            child: Text(
                                              'Deletar',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                            onPressed: () {
                                              controller.deletePost(
                                                  snapshot.data[index].id);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )));
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
