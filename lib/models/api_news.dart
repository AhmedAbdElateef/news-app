class NewsModel {
  // final String author;
  final String title;
  final String url;
  final String date;
  final String image;
  // final String category;
  final String description;
  final String content;

  NewsModel({
    required this.title,
    required this.url,
    required this.date,
    // required this.author,
    // required this.category,
    required this.description,
    required this.content,
    required this.image
  });
  factory NewsModel.fromjson(jsondata) {
    return NewsModel(
      // author: jsondata["author"],
      title: jsondata["title"],
      url: jsondata["url"],
      date: jsondata["publishedAt"],
      // category: jsondata["category"][0],
      description: jsondata["description"],
      content: jsondata["content"],
      image: jsondata["image"]
    );
  }
}

// class NewsList {
//   late String status;
//   late double totalResults;
//   late List<NewsModel> sourcesList = [];
//   NewsList.fromjson(Map<String, dynamic> jsonList) {
//     status = jsonList["status"];
//     totalResults = jsonList["totalResults"];
//     for (var x in jsonList["articles"]) {
//       sourcesList.add(NewsModel.fromjson(x));
//     }
//   }
// }
