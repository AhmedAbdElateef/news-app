import 'package:dio/dio.dart';
import '../models/api_news.dart';

class NewsService {
  Dio dio = Dio(BaseOptions(baseUrl: "https://gnews.io"));

  Future<List<NewsModel>> getProduts({required String url}) async {
    Response response = await dio.get(url);
    List<dynamic> data = response.data['articles'];
    List<NewsModel> listNews = [];
    for (int i = 0; i < data.length; i++) {
      listNews.add(NewsModel.fromjson(data[i]));
    }

    // print(data);
    return listNews;
  }
}
