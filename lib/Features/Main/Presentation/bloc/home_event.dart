part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends HomeEvent {}

class FetchDataCompletedEvent extends HomeEvent {}

class DeleteItemEvent extends HomeEvent {
  final DataEntity todo;
  const DeleteItemEvent(this.todo);
}

class AddItemEvent extends HomeEvent {
  final DataEntity todo;
  const AddItemEvent(this.todo);
}

class ClearDataEvent extends HomeEvent {}
