part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class LoadingNews extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> articles;

  NewsLoaded({required this.articles});
}
