
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:perlatech/core/usecase/app_theme_usecases.dart';
import 'package:perlatech/home/domain/usecases/data_store_use_cases.dart';

import '../../../core/services/data_store.dart';
import '../../../core/services/services_locator.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<AddDataEvent>(_onSetDataMode);
    on<GetDataEvent>(_onGetDataMode);
    on<DeleteDataEvent>(_onDeleteDataMode);
  }

  void _onSetDataMode(AddDataEvent event, Emitter<HomeState> emit) async {
    final data = await sl<SetDataUseCase>()(SetDataParams(event.data));
    emit(state.copyWith(data: data));
  }

  void _onGetDataMode(GetDataEvent event, Emitter<HomeState> emit) async {
    final data = await sl<GetDataUseCase>()(NoParams());
    emit(state.copyWith(data: data));
  }

  void _onDeleteDataMode(DeleteDataEvent event, Emitter<HomeState> emit) async {
    final data = await sl<DeleteDataUseCase>()(DeleteDataParams(event.uuid));
    emit(state.copyWith(data: data));
  }

  void getData() {
    add(GetDataEvent());
  }

  void setData(String data) {
    add(AddDataEvent(data));
  }

  void deleteData(String uuid) {
    add(DeleteDataEvent(uuid));
  }
}
