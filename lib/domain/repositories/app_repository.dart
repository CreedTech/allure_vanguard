import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateTheme(String theme);
  Future<Either<AppError, String>> getPreferredTheme();
}
