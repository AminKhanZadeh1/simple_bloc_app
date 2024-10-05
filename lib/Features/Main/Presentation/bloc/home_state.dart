part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class FetchDataLoadingState extends HomeState {}

class FetchDataCompletedState extends HomeState {
  final List<DataEntity> todos;
  const FetchDataCompletedState({required this.todos});
}

class FetchDataErrorState extends HomeState {
  final String error;
  const FetchDataErrorState(this.error);
}
