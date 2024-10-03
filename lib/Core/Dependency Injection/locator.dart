import 'package:bloc_app/Features/Data/Repository/home_repository_impl.dart';
import 'package:bloc_app/Features/Domain/Repository/home_repository.dart';
import 'package:bloc_app/Features/Domain/UseCases/usecases.dart';
import 'package:bloc_app/Features/Presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  // Repository
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl());

  // Use Cases
  locator.registerSingleton<FetchDataUseCase>(FetchDataUseCase(locator()));

  locator.registerSingleton<AddItemUseCase>(AddItemUseCase(locator()));

  locator.registerSingleton<DeleteItemUseCase>(DeleteItemUseCase(locator()));

  locator.registerSingleton<ClearDataUseCase>(ClearDataUseCase(locator()));

  // Bloc
  locator.registerSingleton<HomeBloc>(
      HomeBloc(locator(), locator(), locator(), locator()));
}
