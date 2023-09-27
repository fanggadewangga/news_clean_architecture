import 'package:get_it/get_it.dart';
import 'package:news_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_clean_architecture/features/daily_news/data/sources/local/app_database.dart';
import 'package:news_clean_architecture/features/daily_news/data/sources/remote/news_api_service.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:news_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecase/get_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecase/get_saved_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecase/remove_article.dart';
import 'package:news_clean_architecture/features/daily_news/domain/usecase/save_article.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/local/bloc/local_article_bloc.dart';
import 'package:news_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // db
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database').build();
  serviceLocator.registerSingleton<AppDatabase>(database);

  // Dio
  serviceLocator.registerSingleton<Dio>(Dio());

  // Dependencies
  serviceLocator
      .registerSingleton<NewsApiService>(NewsApiService(serviceLocator()));

  serviceLocator.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(serviceLocator(), serviceLocator()));

  // Usecase
  serviceLocator.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(serviceLocator()));

  serviceLocator.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(serviceLocator()));

  serviceLocator.registerSingleton<SaveArticleUseCase>(
      SaveArticleUseCase(serviceLocator()));

  serviceLocator.registerSingleton<RemoveArticleUseCase>(
      RemoveArticleUseCase(serviceLocator()));

  //Blocs
  serviceLocator.registerFactory<RemoteArticlesBloc>(
      () => RemoteArticlesBloc(serviceLocator()));

  serviceLocator.registerFactory<LocalArticleBloc>(() =>
      LocalArticleBloc(serviceLocator(), serviceLocator(), serviceLocator()));
}
