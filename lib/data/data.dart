// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:note_app/data/getall_notes_resp_obj/getall_notes_resp_obj.dart';
import 'package:note_app/data/note_model/note_model.dart';
import 'package:dio/dio.dart';
import 'package:note_app/data/url.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>> getAllNotes();
}

class NoteApi implements ApiCalls {
  // Singleton instance
  static NoteApi? _instance;
  // Private constructor
  NoteApi._internal();
  // Factory constructor to get the singleton instance
  factory NoteApi() {
    if (_instance == null) {
      _instance = NoteApi._internal();
      _instance!.initialize();
    }
    return _instance!;
  }
  // End of Singleton instance

  final dio = Dio();
  final url = Urls();

  ValueNotifier<List<NoteModel>> noteListNotifier = ValueNotifier([]);

  void initialize() {
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
    );
  }

  @override
  Future<NoteModel?> createNote(NoteModel value) async {
    try {
      final _response = await dio.post(
        url.createNote,
        data: value.toJson(),
      );
      final _responseAsJson = jsonDecode(_response.data);
      return NoteModel.fromJson(_responseAsJson as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final _response = await dio.get(url.getAllNotes);
      if (_response.data == null) {
        return [];
      } else {
        final _responseAsJson = jsonDecode(_response.data);
        final getNoteResp = GetallNotesRespObj.fromJson(
            _responseAsJson as Map<String, dynamic>);
        noteListNotifier.value.clear();
        noteListNotifier.value.addAll(getNoteResp.data.reversed);
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        noteListNotifier.notifyListeners();
        return getNoteResp.data;
      }
    } catch (e) {
      noteListNotifier.value.clear();
      print(e.toString());
      return [];
    }
  }

  NoteModel? getNotebyId(String id) {
    try {
      final _result =
          noteListNotifier.value.firstWhere((note) => note.id == id);
      return _result;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
