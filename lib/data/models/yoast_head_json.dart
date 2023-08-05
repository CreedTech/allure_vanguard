import 'package:allure_vanguard/domain/entities/yoast_entity.dart';

enum GraphType { ARTICLE, WEB_PAGE, BREADCRUMB_LIST, WEB_SITE, ORGANIZATION, PERSON }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

final graphTypeValues = EnumValues({
  "Article": GraphType.ARTICLE,
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "Organization": GraphType.ORGANIZATION,
  "Person": GraphType.PERSON,
  "WebPage": GraphType.WEB_PAGE,
  "WebSite": GraphType.WEB_SITE
});

class YoastHeadJson  extends YoastEntity{
  YoastHeadJson({
    this.title,
    required this.ogTitle,
    required this.ogDescription,
    this.ogUrl,
    this.articlePublishedTime,
    this.ogImage,
    required this.author,
    this.schema,
  }) : super(
    ogTitle: ogTitle,
    ogDescription: ogDescription,
    author: author,
  );

  final String? title;
  final String ogTitle;
  final String ogDescription;
  final String? ogUrl;
  final DateTime? articlePublishedTime;
  final List<OgImage>? ogImage;
  final String author;
  final Schema? schema;

  factory YoastHeadJson.fromJson(Map<dynamic, dynamic> json) => YoastHeadJson(
    title: json["title"],
    ogTitle: json["og_title"],
    ogDescription: json["og_description"],
    ogUrl: json["og_url"],
    articlePublishedTime: json["article_published_time"] == null ? null : DateTime.parse(json["article_published_time"]),
    ogImage: json["og_image"] == null ? [] : List<OgImage>.from(json["og_image"]!.map((x) => OgImage.fromJson(x))),
    author: json["author"]!,
    schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
  );

  Map<dynamic, dynamic> toJson() => {
    "title": title,
    "og_title": ogTitle,
    "og_description": ogDescription,
    "og_url": ogUrl,
    "article_published_time": articlePublishedTime?.toIso8601String(),
    "og_image": ogImage == null ? [] : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
    "author": author,
    "schema": schema?.toJson(),
  };
}


class OgImage {
  OgImage({
    this.url,
  });

  final String? url;

  factory OgImage.fromJson(Map<dynamic, dynamic> json) => OgImage(
    url: json["url"],
  );

  Map<dynamic, dynamic> toJson() => {
    "url": url,
  };
}


class Schema {
  Schema({
    this.graph,
  });

  final List<Graph>? graph;

  factory Schema.fromJson(Map<dynamic, dynamic> json) => Schema(
    graph: json["@graph"] == null ? [] : List<Graph>.from(json["@graph"]!.map((x) => Graph.fromJson(x))),
  );

  Map<dynamic, dynamic> toJson() => {
    "@graph": graph == null ? [] : List<dynamic>.from(graph!.map((x) => x.toJson())),
  };
}


class Graph {
  Graph({
    this.type,
    this.articleSection,
  });

  final GraphType? type;
  final List<String>? articleSection;

  factory Graph.fromJson(Map<dynamic, dynamic> json) => Graph(
    type: graphTypeValues.map[json["@type"]]!,
    articleSection: json["articleSection"] == null ? [] : List<String>.from(json["articleSection"]!.map((x) => x)),
  );

  Map<dynamic, dynamic> toJson() => {
    "@type": graphTypeValues.reverse[type],
    "articleSection": articleSection == null ? [] : List<dynamic>.from(articleSection!.map((x) => x)),
  };
}
