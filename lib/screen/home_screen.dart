import 'package:flutter/material.dart';
import 'package:news/model/article.dart';
import 'package:news/theme.dart';
import 'package:news/widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final topSpacing = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: topSpacing),
          _homeHeader(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 48,
                crossAxisSpacing: 12,
                mainAxisExtent: 207,
              ),
              itemBuilder: (context, index) {
                final article = Article(
                  author: 'Author $index',
                  title: 'Title $index',
                  description: 'Description $index',
                  url: '',
                  urlToImage: 'https://picsum.photos/id/$index/200/300',
                  publishedAt: '2',
                  content: 'Tiss is a fake content',
                );
                return ArticleTile(article: article);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// returns a 'News' title with breaker line
  Widget _homeHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 42, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'News',
            style: TextStyle(fontSize: 48),
          ),
          Divider(
            thickness: 8,
            color: OrangeColor,
            height: 48,
          )
        ],
      ),
    );
  }
}
