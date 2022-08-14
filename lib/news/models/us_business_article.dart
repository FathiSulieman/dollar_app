class Article {
  final String? author, title, description, url, imageUrl;
  final content;
  final source;

  Article({
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.source,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        imageUrl: json['urlToImage'],
        source: json['source']);
  }
}
