part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddDataEvent extends HomeEvent {
  final String data;

  AddDataEvent(this.data);
}

class DeleteDataEvent extends HomeEvent {
  final String uuid;

  DeleteDataEvent(this.uuid);
}

class GetDataEvent extends HomeEvent {

}
