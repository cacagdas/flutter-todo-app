import 'package:dio/dio.dart';
import 'package:flutter_todo_app/cubit/add_todo_cubit.dart';
import 'package:flutter_todo_app/cubit/edit_todo_cubit.dart';
import 'package:flutter_todo_app/cubit/todos_cubit.dart';
import 'package:flutter_todo_app/data/remote/dio_client.dart';
import 'package:flutter_todo_app/data/remote/todos_service.dart';
import 'package:flutter_todo_app/data/repository/todos_repository.dart';
import 'package:flutter_todo_app/di/module/network_module.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<Dio>(NetworkModule.provideDio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  getIt.registerSingleton(TodosService(getIt<DioClient>()));
  getIt.registerSingleton(TodosRepository(getIt<TodosService>()));

  getIt.registerSingleton(TodosCubit(getIt<TodosRepository>()));
  getIt.registerSingleton(
      AddTodoCubit(getIt<TodosRepository>(), getIt<TodosCubit>()));
  getIt.registerSingleton(
      EditTodoCubit(getIt<TodosRepository>(), getIt<TodosCubit>()));
}
