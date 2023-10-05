import 'package:json_annotation/json_annotation.dart';
import 'package:note_app/data/note_model/note_model.dart';

part 'getall_notes_resp_obj.g.dart';

@JsonSerializable()
class GetallNotesRespObj {
	bool? status;
	List<NoteModel> data;

	GetallNotesRespObj({this.status, this.data = const []});

	factory GetallNotesRespObj.fromJson(Map<String, dynamic> json) {
		return _$GetallNotesRespObjFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GetallNotesRespObjToJson(this);
}
