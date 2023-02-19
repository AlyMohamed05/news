import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocs/news/news_bloc.dart';
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
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is LoadingNews) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NewsInitial) {
                BlocProvider.of<NewsBloc>(context).add(LoadMoreNews());
                return const Center();
              } else {
                final articlesState = state as NewsLoaded;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 48,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 207,
                    ),
                    itemCount: articlesState.articles.length,
                    itemBuilder: (context, index) {
                      return ArticleTile(
                          article: articlesState.articles[index]);
                    },
                  ),
                );
              }
            },
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
