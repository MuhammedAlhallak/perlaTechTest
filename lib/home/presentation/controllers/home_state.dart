part of 'home_bloc.dart';

class HomeState {
  final List<DataModel> data;

  HomeState({this.data = const []});

  HomeState copyWith({List<DataModel>? data}) {
    return HomeState(data: data ?? this.data);
  }
}
