import 'package:dartz/dartz.dart';

import '../../domain/entities/app_error.dart';
import '../../domain/repositories/app_repository.dart';
import '../data_sources/theme_local_data_source.dart';

class AppRepositoryImpl extends AppRepository {
  final ThemeLocalDataSource themeLocalDataSource;

  AppRepositoryImpl(this.themeLocalDataSource);


  @override
  Future<Either<AppError, String>> getPreferredTheme() async {
    try {
      final response = await themeLocalDataSource.getPreferredTheme();
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateTheme(String themeName) async {
    try {
      final response = await themeLocalDataSource.updateTheme(themeName);
      return Right(response);
    } on Exception {
      return Left(AppError(AppErrorType.database));
    }
  }
}
