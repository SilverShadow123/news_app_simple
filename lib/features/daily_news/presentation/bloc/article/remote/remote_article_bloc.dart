import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_simple/core/resources/data_state.dart';
import 'package:news_app_simple/features/daily_news/domain/usecases/get_article.dart';

import '../../../../domain/entities/article.dart';

part 'remote_article_event.dart';

part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
    : super(const RemoteArticleLoadingState()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
    GetArticles event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleLoadedState(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleErrorState(dataState.error!));
    }
  }
}
