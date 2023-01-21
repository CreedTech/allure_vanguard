part of widgets;

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    getHotNewsBloc..getHotNews();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
      stream: getTopHeadlinesBloc.subject.stream,
      builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.error.length > 0) {
            return buildErrorWidget(snapshot.data!.error);
          }
          return _buildNewsListWidget(snapshot.data!);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error as String);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildNewsListWidget(ArticleResponse data) {
    List<ArticleModel> articles = data.articles;
    var scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent * 0.8) {
        print('At the end of the list');
      }
    });
    return SizedBox(
        height:500,
        // height: articles.length * 25.toDouble(),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 124.0,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      left: 25.0, bottom: 16.0, right: 18.0, top: 25.0),
                  decoration: const BoxDecoration(
                      // border: Border(
                      //   bottom: BorderSide(
                      //     width: 1.0,
                      //     color: Color(0xffEEEEEE),
                      //   ),
                      // ),
                      ),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageBuilder: (context, imageProvider) =>
                            Container(
                          height: 80.0,
                          width: 80.0,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Container(
                              height: 80.0,
                              width: 80.0,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(5.0),

                              ),
                              child: Icon(Icons.error),
                            ),

                        imageUrl: articles[index].img ?? '',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articles[index].title!,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  // width: double.infinity,
                                  // height: 20,

                                  child: Text(
                                    'By '.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: AppPalette.greyColor,
                                      height: 1,
                                      // letterSpacing: 1,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                                Container(
                                  // alignment: Alignment.,
                                  width: 50.w,
                                  // height: 20,

                                  child: Text(
                                    articles[index]
                                        .author
                                        ?.toUpperCase() ??
                                        'Not Prescribed'
                                            .toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: AppPalette.accentColor,
                                      fontSize: 11,
                                      height: 1,
                                      overflow: TextOverflow.ellipsis,

                                      // letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                // Text.rich(
                                //   TextSpan(
                                //     text: 'By '.toUpperCase(),
                                //     style: const TextStyle(
                                //       fontWeight: FontWeight.w400,
                                //       fontStyle: FontStyle.normal,
                                //       color: AppPalette.greyColor,
                                //       height: 1,
                                //       // letterSpacing: 1,
                                //       fontSize: 11,
                                //     ),
                                //     children: <InlineSpan>[
                                //       TextSpan(
                                //         text: articles[index]
                                //                 .author
                                //                 ?.toUpperCase() ??
                                //             'Not Prescribed'
                                //                 .toUpperCase(),
                                //         style: const TextStyle(
                                //           fontWeight: FontWeight.w400,
                                //           fontStyle: FontStyle.normal,
                                //           color: AppPalette.accentColor,
                                //           fontSize: 11,
                                //           height: 1,
                                //           overflow: TextOverflow.ellipsis,
                                //
                                //           // letterSpacing: 1,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(5.0),
                                  // width: double.infinity,
                                  // height: 20,
                                  decoration: BoxDecoration(
                                    color: AppPalette.accentColor,
                                  ),
                                  child: Text(
                                    articles[index]
                                        .source!
                                        .name!
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: AppPalette.whiteColor,
                                        fontSize: 9.0),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 13,
                                      color: AppPalette.greyColor,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 7.0),
                                      child: Text(
                                        timePosted(DateTime.parse(
                                            articles[index].date!)),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: AppPalette.greyColor,
                                          height: 1,
                                          // letterSpacing: 1,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // return ListTile(
              //   onTap: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => webview_widget(url: snapshot.data![index].link)),
              //     // );
              //   },
              //   leading: Image(
              //     image: articles[index].img == null
              //         ? AssetImage(AppImages.splashImage)
              //         : NetworkImage(articles[index].img!)
              //             as ImageProvider,
              //   ),
              //   title: Text(articles[index].title!),
              //   subtitle: Text(
              //     timePosted(
              //       DateTime.parse(articles[index].date!),
              //     ),
              //   ),
              // ); //SliverChildBuilderDelegate
            } //SliverList
            ));
  }

  // @override
  // Widget build(BuildContext context) {
  //   return  SizedBox(
  //     // height: 500,
  //       child: CupertinoScrollbar(
  //           thickness: 5.0,
  //           thicknessWhileDragging: 10.0,
  //           radius: const Radius.circular(34.0),
  //           radiusWhileDragging: Radius.zero,
  //           //controller: _controllerOne,
  //           thumbVisibility: true,
  //           child: ListView.builder(
  //               itemCount: 50,
  //               itemBuilder: (BuildContext context, int index) {
  //                 return ListTile(
  //                   onTap: () {
  //                     // Navigator.push(
  //                     //   context,
  //                     //   MaterialPageRoute(builder: (context) => webview_widget(url: snapshot.data![index].link)),
  //                     // );
  //                   },
  //                   title: Text(snapshot.data![index].title),
  //                   subtitle: Text(formatter.format(snapshot.data![index].pub_date).toString()),
  //                 ); //SliverChildBuilderDelegate
  //
  //               } //SliverList
  //           )
  //       )
  //   );
  // }
}

// String timePosted(DateTime date) {
//   return DateFormat.yMMMMd().format(date);
// }
