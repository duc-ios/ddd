import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
{{#is_bloc}}import 'package:bloc/bloc.dart';{{/is_bloc}}{{#is_riverpod}}import 'package:riverbloc/riverbloc.dart';
import '../../../../common/utils/getit_utils.dart';{{/is_riverpod}}

import '../../../../common/mixin/cancelable_bloc_base.dart';
import '../../../../core/domain/errors/api_error.dart';
import '../../domain/entities/{{name.snakeCase()}}.dart';
import '../../domain/repositories/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_state.dart';
part '{{name.snakeCase()}}_cubit.freezed.dart';

{{#is_riverpod}}final {{name.camelCase()}}Provider = AutoDisposeBlocProvider<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>((_) {
  return getIt<{{name.pascalCase()}}Cubit>();
});{{/is_riverpod}}

@injectable
class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> with CancelableBlocBase {
  final {{name.pascalCase()}}Repository _repository;

  {{name.pascalCase()}}Cubit(this._repository) : super(const {{name.pascalCase()}}State());
  
  void onLoaded() => emit(state.copyWith(status: const _LoadedStatus()));

  get() async {
    emit(state.loading);
    final response = await _repository.getById(1, token: cancelToken);
    response.fold(
      (result) => emit(state.onLoaded(result)),
      (error) => emit(state.onError(error)),
    );
  }
}