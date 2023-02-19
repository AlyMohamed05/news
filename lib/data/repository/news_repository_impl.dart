import 'package:news/data/network/news_datasource_impl.dart';
import 'package:news/domain/news_repository.dart';
import 'package:news/model/article.dart';

class NewsRepositoryImpl extends NewsRepository {
  final newsSource =
      NewsDataSourceImpl(apiKey: '6b93f8710d0a48f483e641263dcd6e55');

  @override
  Future<List<Article>> getArticles(int page) async {
    try {
      final jsonArticles = await newsSource.fetchNews(
        'everything',
        1,
      );
      final List<Article> arts = [];
      jsonArticles['articles'].forEach(
        (element) {
          try {
            final article = Article.fromJson(element);
            arts.add(article);
          } catch (e) {
            print(e);
          }
        },
      );
      return arts;
    } catch (e, st) {
      print(e);
      print(st);
      return <Article>[];
    }
  }
}
