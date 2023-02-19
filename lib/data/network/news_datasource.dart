abstract class NewsDataSource {
  Future<Map<String, dynamic>> fetchNews(String url, int page);
}
