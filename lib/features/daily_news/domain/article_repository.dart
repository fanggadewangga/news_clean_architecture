import 'package:news_clean_architecture/core/resources/data_state.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';

abstract class ArticleRepository {
  // API methods
  Future<DataState<List<ArticleModel>>> getNewsArticles();
}
