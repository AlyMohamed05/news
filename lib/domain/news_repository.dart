import 'package:news/model/article.dart';

abstract class NewsRepository {
  Future<List<Article>> getArticles(int page);
}
