import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';
import '../../../../common/utils/app_environment.dart';
import '../../../../core/domain/errors/api_error.dart';
import '../../../{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

@LazySingleton(
  as: {{name.pascalCase()}}Repository,
  env: AppEnvironment.environments,
)
class {{name.pascalCase()}}RepositoryImpl implements {{name.pascalCase()}}Repository {
  @override
  Future<Result<{{name.pascalCase()}}, ApiError>> getById(int id, {CancelToken? token}) async {
    // TODO: implement getById
    throw UnimplementedError();
  }
}