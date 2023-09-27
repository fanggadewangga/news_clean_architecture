import 'package:floor/floor.dart';
import 'package:news_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:news_clean_architecture/features/daily_news/data/sources/local/DAO/article_dao.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO; 
}
