import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
{{#is_bloc}}import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/utils/getit_utils.dart';
{{/is_bloc}}{{^is_bloc}}import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/is_bloc}}
import '../../application/{{name.snakeCase()}}_cubit/{{name.snakeCase()}}_cubit.dart';
import '../../../../common/extensions/build_context_dialog.dart';
import '../widgets/{{name.snakeCase()}}_body.dart';

@RoutePage()
{{#is_bloc}}class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<{{name.pascalCase()}}Cubit>(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocListener<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
          listener: (context, state) => state.status
              .whenOrNull(
                error: (error) async {
                  await context.showApiError(error);
                  getIt<{{name.pascalCase()}}Cubit>().onLoaded();
                },
              ),
          child: const {{name.pascalCase()}}Body(),
        ),
      ),
    );
  }
}{{/is_bloc}}{{^is_bloc}}class {{name.pascalCase()}}Page extends ConsumerWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = {{name.camelCase()}}Provider;
    ref.listen(
      provider,
      (_, current) => current.status
          .whenOrNull(
            error: (error) async {
              await context.showApiError(error);
              ref.read(provider.bloc).onLoaded();
            },
          );
    return Scaffold(
      appBar: AppBar(),
      body: const {{name.pascalCase()}}Body(),
    );
  }
}{{/is_bloc}}