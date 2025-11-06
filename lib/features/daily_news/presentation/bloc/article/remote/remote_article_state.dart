part of 'remote_article_bloc.dart';

abstract class RemoteArticleState extends Equatable{
  final List<ArticleEntity> ? articles;
  final DioException ? error;
  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];


}

class RemoteArticleLoadingState extends RemoteArticleState{
  const RemoteArticleLoadingState();
}

class RemoteArticleLoadedState extends RemoteArticleState{
  const RemoteArticleLoadedState(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticleErrorState extends RemoteArticleState {
  const RemoteArticleErrorState(DioException error) : super(error: error);
}