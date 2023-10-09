import 'package:flutter/material.dart';
import 'package:note_app/data/add_note.dart';
import 'package:note_app/data/data.dart';

class NoteItem extends StatelessWidget {
  const NoteItem(
      {super.key,
      required this.title,
      required this.id,
      required this.content});

  final String id;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('works');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => ScreenAddnote(
                  type: ActionType.editNote,
                  id: id,
                )));
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 23,
                ),
              )),
              IconButton(
                onPressed: () {
                  deleteNote(id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          ),
          Text(
            content,
            style: const TextStyle(fontStyle: FontStyle.italic),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Future<void> deleteNote(String id) async {
    await NoteApi().deleteNoteById(id);
    await NoteApi().getAllNotes();
  }
}
