import 'package:perlatech/core/services/data_store.dart';

import '../../../core/usecase/app_theme_usecases.dart';
import '../../../core/usecase/base_usecase.dart';
import 'package:uuid/uuid.dart';

class GetDataUseCase extends UseCase<Future<List<DataModel>>, NoParams> {
  final DataStore dataStore;

  GetDataUseCase(this.dataStore);

  @override
  Future<List<DataModel>> call(NoParams params) async {
    return await dataStore.getDataList();
  }
}

class SetDataUseCase extends UseCase<Future<List<DataModel>>, SetDataParams> {
  final DataStore dataStore;

  SetDataUseCase(this.dataStore);

  @override
  Future<List<DataModel>> call(SetDataParams params) async {
    final data = await dataStore.getDataList();
    await dataStore.deleteData();
    data.add(DataModel(
        uuid: const Uuid().v4(), text: params.text, date: DateTime.now().toIso8601String()));
    await dataStore.setDataList(data);
    return dataStore.getDataList();
  }
}

class DeleteDataUseCase extends UseCase<Future<List<DataModel>>, DeleteDataParams> {
  final DataStore dataStore;

  DeleteDataUseCase(this.dataStore);

  @override
  Future<List<DataModel>> call(DeleteDataParams params) async {
    final data = await dataStore.getDataList();
    final updatedList = data.where((element) => element.uuid != params.id).toList();
    await dataStore.deleteData();
    await dataStore.setDataList(updatedList);
    return dataStore.getDataList();
  }
}

class SetDataParams extends BaseParams {
  final String text;

  SetDataParams(this.text);
}

class DeleteDataParams extends BaseParams {
  final String id;

  DeleteDataParams(this.id);
}
