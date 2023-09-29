import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_store.g.dart';

@JsonSerializable()
class DataModel {
  String uuid;
  String text;
  String date;

  DataModel({required this.uuid,required this.text,required this.date});


  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

}

class DataStore {
  static final DataStore _instance = DataStore._internal();

  DataStore._internal();

  static const String keyData = "DataModel_KEY";

  factory DataStore() {
    return _instance;
  }

  Future<SharedPreferences> _initStorage() {
    return SharedPreferences.getInstance();
  }

  Future<List<DataModel>> getDataList() async {
    final prefs = await _initStorage();

    if (await checkDataExistence()) {
      final dataModel = prefs.getString(keyData);
      final data = dataModel != null ? json.decode(dataModel) : [];
      List<DataModel> myList = (data as List).map((e) => DataModel.fromJson(e)).toList();
      return myList;
    } else {
      return [];
    }
  }

  Future<void> setDataList(List<DataModel> dataList) async {
    final prefs = await _initStorage();
    prefs.setString(keyData, jsonEncode(dataList.map((e) => e.toJson()).toList()));
  }

  Future<bool> checkDataExistence() async {
    final prefs = await _initStorage();
    return prefs.containsKey(keyData);
  }

  Future<bool> deleteData() async {
    final prefs = await _initStorage();
    return prefs.remove(keyData);
  }
}