// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getall_notes_resp_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetallNotesRespObj _$GetallNotesRespObjFromJson(Map<String, dynamic> json) =>
    GetallNotesRespObj(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NoteModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetallNotesRespObjToJson(GetallNotesRespObj instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
