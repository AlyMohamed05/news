import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/data/network/news_datasource.dart';
import 'package:news/data/repository/news_repository_impl.dart';
import 'package:news/model/article.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final repo = NewsRepositoryImpl();

  NewsBloc() : super(NewsInitial()) {
    on<LoadMoreNews>(_handleLoadingMoreNews);
  }

  Future<void> _handleLoadingMoreNews(
      NewsEvent event, Emitter<NewsState> emitter) async {
    emit(LoadingNews());
    final news = await repo.getArticles(1);
    emit(NewsLoaded(articles: news));
  }
}
