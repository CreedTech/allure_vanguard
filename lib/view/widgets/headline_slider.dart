part of widgets;

class HeadlineSliderWidget extends StatefulWidget {
  @override
  _HeadlineSliderWidgetState createState() => _HeadlineSliderWidgetState();
}

class _HeadlineSliderWidgetState extends State<HeadlineSliderWidget> {
  @override
  void initState() {
    super.initState();
    getTopHeadlinesBloc..getHeadlines();
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
          return _buildHeadlineSliderWidget(snapshot.data!);
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error as String);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildHeadlineSliderWidget(ArticleResponse data) {
    List<ArticleModel> articles = data.articles;
    return
      Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2, microseconds: 50),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          height: 250.0,
          viewportFraction: 1,
        ),
        items: getExpenseSliders(articles),
      ),
    );
  }

    getExpenseSliders(List<ArticleModel> articles) {
      return articles
          .map(
            (article) => GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DetailNews(
                //           article: article,
                //         )));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: article.img == null
                              ? AssetImage(AppImages.failureImage)
                              : NetworkImage(article.img!) as ImageProvider,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          // gradient: LinearGradient(
                          //     begin: Alignment.bottomCenter,
                          //     end: Alignment.topCenter,
                          //     stops: [
                          //       0.1,
                          //       0.9
                          //     ],
                          //     colors: [
                          //       Colors.black.withOpacity(0.9),
                          //       Colors.white.withOpacity(0.0)
                          //     ]),
                          ),
                    ),
                    Positioned(
                      bottom: 10.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: 350.0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              article.title!.toUpperCase(),
                              style: TextStyle(
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 70.0,
                      left: 10.0,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5.0),
                        // width: double.infinity,
                        // height: 20,
                        decoration: BoxDecoration(
                          color: AppPalette.accentColor,
                        ),
                        child: Text(
                          article.source!.name!.toUpperCase(),
                          style: TextStyle(
                              color: AppPalette.whiteColor, fontSize: 9.0),
                        ),
                      ),
                    ),
                    // Positioned(
                    //     bottom: 10.0,
                    //     right: 10.0,
                    //     child: Text(
                    //       timeUntil(DateTime.parse(article.date!)),
                    //       style: TextStyle(color: Colors.white54, fontSize: 9.0),
                    //     ),),
                  ],
                ),
              ),
            ),
          )
          .toList();
    }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
