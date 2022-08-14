import 'package:dollar/news/models/us_business_article.dart';
import 'package:dollar/news/services/api.dart';
import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({Key? key}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  final NewsService _newsService = NewsService();
  List<Article> _articles = [];
  fetchApi() async {
   
    _articles = await _newsService.getBusinessNews();
   
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      ListView.builder(
          
          shrinkWrap: true,
          itemCount: _articles.length,
          itemBuilder: ((context, index) {
            return Text(_articles[index].title!);
          })),
    ]));
  }
}
