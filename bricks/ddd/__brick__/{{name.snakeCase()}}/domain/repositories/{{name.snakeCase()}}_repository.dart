import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../core/domain/errors/api_error.dart';
import '../../../{{name.snakeCase()}}/domain/entities/{{name.snakeCase()}}.dart';

abstract class {{name.pascalCase()}}Repository {
  Future<Result<{{name.pascalCase()}}, ApiError>> getById(int id, {CancelToken? token});
}

