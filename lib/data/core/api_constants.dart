class ApiConstants {
  ApiConstants._();

  // static const String BASE_URL = "https://newsapi.org/v2/";
  static const String BASE_URL = "https://allure.vanguardngr.com/wp-json/wp/v2/";
  static const String CATEGORY_URL = "$BASE_URL/categories";
  //3
  static const String API_KEY = "88e76dfe334046379f987f0b2ffe81df";
  //4
  static const String BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w500";

  static const GET_SOURCES_URL = '$BASE_URL/top-headlines/sources';
  static const GET_TOP_HEADLINES_URL = '$BASE_URL/top-headlines';
  static const EVERYTHING_URL = "$BASE_URL/everything";
}