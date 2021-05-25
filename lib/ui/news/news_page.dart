import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_gpboticario/shared/design/design_colors.dart';
import 'package:desafio_gpboticario/shared/models/news_model.dart';
import 'package:desafio_gpboticario/ui/news/news_controller.dart';
import 'package:desafio_gpboticario/ui/widgets/app_bar_widget.dart';
import 'package:desafio_gpboticario/ui/widgets/post_item.dart';
import 'package:desafio_gpboticario/ui/widgets/section_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsPage extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColors.COLOR_BACKGROUND,
      appBar: AppBarWidget(title: "Notícias"),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        header: WaterDropHeader(
          waterDropColor: DesignColors.COLOR_ORANGE,
        ),
        controller: controller.refreshController,
        onRefresh: controller.onRefresh,
        child: Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 10),
                      child: SectionTextWidget(
                        text: 'Destaques',
                        fontSize: 26,
                      ),
                    ),
                    //TODO:.builder USAR NO CARROSSEL
                    Obx(
                      () => controller.checkIsFetching()
                          ? Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: DesignColors.COLOR_ORANGE,
                                ),
                              ),
                            )
                          : CarouselSlider.builder(
                              itemCount: controller.bannerList.length,
                              options: CarouselOptions(
                                height: 200,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 1200),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                              ),
                              itemBuilder: (_, index, realIndex) => Stack(
                                children: <Widget>[
                                  Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: DesignColors.COLOR_ORANGE,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            controller.bannerList[index].image,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                          backgroundColor:
                                              DesignColors.COLOR_ORANGE,
                                        )),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Text(
                                        controller.bannerList[index].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10, top: 20),
                  child: SectionTextWidget(
                    text: 'Novidades O Boticário',
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: FutureBuilder<List<NewsModel>>(
                  future: controller.getNews(),
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
                            //PARA TESTE POIS JSON NÃO RETORNA ID DO USUÁRIO
                            userId: "64d768dc-bcde-11eb-8529-0242ac130003",
                            userName: snapshot.data[index].user.name,
                            imageAvatarUrl:
                                snapshot.data[index].user.profilePicture,
                            postDescription:
                                snapshot.data[index].message.content,
                            postDate: snapshot.data[index].message.createdAt,
                            onOptionsTap: null,
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
    );
  }
}
