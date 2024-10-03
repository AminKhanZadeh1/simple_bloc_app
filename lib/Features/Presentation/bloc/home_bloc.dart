import 'package:bloc/bloc.dart';
import 'package:bloc_app/Core/Utils/Failures/data_state.dart';
import 'package:bloc_app/Features/Domain/Entities/data_entity.dart';
import 'package:bloc_app/Features/Domain/UseCases/usecases.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchDataUseCase fetchItemUseCase;
  final AddItemUseCase addItemUseCase;
  final DeleteItemUseCase deleteItemUseCase;
  final ClearDataUseCase clearDataUseCase;
  HomeBloc(this.fetchItemUseCase, this.addItemUseCase, this.deleteItemUseCase,
      this.clearDataUseCase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is FetchDataEvent) {
        emit(FetchDataLoadingState());
        DataState dataState = await fetchItemUseCase.call();
        if (dataState is DataSuccess) {
          emit(FetchDataCompletedState(todos: dataState.data));
        } else if (dataState is DataFailed) {
          emit(FetchDataErrorState(dataState.error!));
        }
      }
      if (event is AddItemEvent) {
        await addItemUseCase.call(body: event.todo);
      }
      if (event is DeleteItemEvent) {
        await deleteItemUseCase.call(body: event.todo);
      }
      if (event is ClearDataEvent) {
        await clearDataUseCase.call();
      }
    });
  }
}
