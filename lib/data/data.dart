import 'dart:convert';
import 'package:note_app/data/note_model/note_model.dart';
import 'package:dio/dio.dart';
import 'package:note_app/data/url.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel value);
}

class NoteApi implements ApiCalls {
  final dio = Dio();
  final url = Urls();

  NoteApi() {
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
    }
  }
}
