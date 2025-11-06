import 'package:news_app_simple/core/resources/data_state.dart';
import 'package:news_app_simple/features/daily_news/domain/entities/article.dart';

import '../../../../core/usecase/usecase.dart';
import '../repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
