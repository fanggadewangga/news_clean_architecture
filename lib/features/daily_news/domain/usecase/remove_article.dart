import 'package:news_clean_architecture/core/usecase/usecase.dart';
import 'package:news_clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUseCase implements Usecase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.deleteArticle(params!);
  }
}