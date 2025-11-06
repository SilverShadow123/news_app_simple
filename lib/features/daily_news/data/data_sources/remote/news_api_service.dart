import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constant/constants.dart';
import '../../models/article_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl:newsAPIBaseURL)
abstract class NewsApiService{
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
      @Query("apiKey") String ? apikey,
      @Query("country") String ? country,
      @Query("category") String ? category,
  });


}