import 'package:flutter/material.dart';
import 'package:note_app/data/data.dart';
import 'package:note_app/data/note_model/note_model.dart';

enum ActionType { addNote, editNote }

// ignore: must_be_immutable
class ScreenAddnote extends StatelessWidget {
  final ActionType type;
  String? id;

  ScreenAddnote({super.key, required this.type, this.id});

  final _noteTitleInput = TextEditingController();
  final _noteContentInput = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print("came here");
    if (type == ActionType.editNote) {
      if (id == null) {
        print("somehow I am here");
        Navigator.of(context).pop();
      } else {
        final note = NoteApi().getNotebyId(id!);
        if (note != null) {
          print(note!.title);
          _noteTitleInput.text = note!.title ?? 'No title';
          _noteContentInput.text = note!.content ?? 'No Content';
        }
      }
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(type == ActionType.addNote ? 'Add note' : 'Edit note'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _noteTitleInput,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Note Title',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _noteContentInput,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'write your note here...',
              ),
              maxLines: null,
              minLines: 6,
              maxLength: 100,
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
              onPressed: () {
                switch (type) {
                  case ActionType.addNote:
                    addNote();
                    break;
                  case ActionType.editNote:
                    print('edit note clicked');
                    break;
                }
              },
              icon: const Icon(Icons.done),
              label:
                  Text(type == ActionType.addNote ? 'Add Note' : 'Edit Note'),
            )
          ],
        ),
      )),
    );
  }

  Future<void> addNote() async {
    final _newNote = NoteModel.create(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: _noteTitleInput.text,
        content: _noteContentInput.text);

    NoteApi().createNote(_newNote);
    print("note saved");
    Navigator.of(_scaffoldKey.currentContext!).pop();
  }
}
