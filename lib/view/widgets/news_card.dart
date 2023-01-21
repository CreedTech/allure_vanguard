part of widgets;

class NewsCard extends StatefulWidget {
  const NewsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  void initState() {
    super.initState();
    getHotNewsBloc..getHotNews();
  }

  late bool hoverColor = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ArticleResponse>(
      stream: getTopHeadlinesBloc.subject.stream,
      builder: (context, AsyncSnapshot<ArticleResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.error.length > 0) {
            return buildErrorWidget(snapshot.data!.error);
          }
          return _buildNewsCardWidget(snapshot.data!);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error as String);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildNewsCardWidget(ArticleResponse data) {
    List<ArticleModel> articles = data.articles;
    var scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent * 0.8) {
        print('At the end of the list');
      }
    },);
    return SingleChildScrollView(
      child: Container(
        height: 50.h,
        // height: articles.length * 210.toDouble(),
        // padding: const EdgeInsets.only(bottom: 8),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 1,
          // itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ArticleView(
                  //       article: article,
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Image(
                            image: articles[index].img == null
                                ? AssetImage(AppImages.splashImage)
                                : NetworkImage(articles[index].img!)
                                    as ImageProvider,
                          ),
                          Positioned(
                            top: 10.0,
                            left: 0.0,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5.0),
                              // width: double.infinity,
                              // height: 20,
                              decoration: BoxDecoration(
                                color: AppPalette.accentColor,
                              ),
                              child: Text(
                                articles[index].source!.name!.toUpperCase(),
                                style: TextStyle(
                                    color: AppPalette.whiteColor,
                                    fontSize: 9.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        articles[index].title ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          color: AppPalette.blackColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'By '.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: AppPalette.greyColor,
                                height: 1,
                                // letterSpacing: 1,
                                fontSize: 11,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: articles[index].author?.toUpperCase() ??
                                      'Not Prescribed'.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: AppPalette.accentColor,
                                    fontSize: 11,
                                    height: 1,
                                    // letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Text(
                              '/',
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
                          Icon(
                            Icons.access_time,
                            size: 13,
                            color: AppPalette.greyColor,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Text(
                              timePosted(
                                DateTime.parse(articles[index].date!),
                              ),
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
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        articles[index].description ?? '',
                        maxLines: 4,
                      ),
                      ButtonWidget(title: 'Read More', onButtonTap: () {},),
                      // ElevatedButton(
                      //   onHover: (hovered) {
                      //     setState(() {
                      //       hoverColor = hovered;
                      //     });
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     elevation: 0,
                      //     backgroundColor:
                      //         hoverColor ? Colors.red : AppPalette.whiteColor,
                      //     side: BorderSide(
                      //       width: 1.0,
                      //       color: AppPalette.accentColor,
                      //     ),
                      //   ),
                      //   // style: ButtonStyle(
                      //   //   // shape: MaterialStateProperty.resolveWith((states) => OutlinedBorder),
                      //   //   elevation:
                      //   //       MaterialStateProperty.resolveWith((states) => 0),
                      //   //   // backgroundColor: MaterialStateColor.resolveWith((states) => AppPalette.whiteColor),
                      //   //   side: MaterialStateProperty.resolveWith(
                      //   //     (states) => BorderSide(
                      //   //       width: 1.0,
                      //   //       color: AppPalette.accentColor,
                      //   //     ),
                      //   //   ),
                      //   //
                      //   //   overlayColor:
                      //   //       MaterialStateProperty.resolveWith<Color?>(
                      //   //     (Set<MaterialState> states) {
                      //   //       if (states.contains(MaterialState.hovered)) {
                      //   //         return AppPalette.accentColor; //<-- SEE HERE
                      //   //       }
                      //   //       else {
                      //   //         return Colors.transparent;// Defer to the widget's default.
                      //   //       }
                      //   //     },
                      //   //   ),
                      //   // ),
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Read More'.toUpperCase(),
                      //     style: TextStyle(
                      //       color: AppPalette.greyColor,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

String timePosted(DateTime date) {
  return DateFormat.yMMMMd().format(date);
}
