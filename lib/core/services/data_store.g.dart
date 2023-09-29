// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      uuid: json['uuid'] as String,
      text: json['text'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'text': instance.text,
      'date': instance.date,
    };
