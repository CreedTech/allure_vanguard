import 'package:dartz/dartz.dart';

import '../entities/app_error.dart';

abstract class UseCase<Type, Params> {
  //2
  Future<Either<AppError, Type>> call(Params params);
}