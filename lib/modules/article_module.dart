class ArticleModule {
  final String articleTitle;
  final String? articleImage;
  final String? articleSubTitle;
  final String articleUrl;

  ArticleModule(
      {required this.articleTitle,
      required this.articleImage,
      required this.articleSubTitle,
      required this.articleUrl});
  factory ArticleModule.fromJson({required Map<String, dynamic> json}) {
    return ArticleModule(
      articleTitle: json["title"],
      articleImage: json["urlToImage"],
      articleSubTitle: json["description"],
      articleUrl: json["url"],
    );
  }
}
