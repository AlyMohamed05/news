import 'package:news/data/network/news_datasource.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsDataSourceImpl extends NewsDataSource {
  final String _baseUrl = "https://newsapi.org/v2/";

  final String apiKey;

  NewsDataSourceImpl({required this.apiKey});

  @override
  Future<Map<String, dynamic>> fetchNews(String url, int page) async {
    final response = await http.get(
      Uri.parse(_baseUrl + url).replace(
        queryParameters: {
          'domains': 'bbc.co.uk',
        },
      ),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json'
      },
    );
    return json.decode(response.body);
  }
}
