import 'package:flutter/material.dart';
import 'package:note_app/data/add_note.dart';
import 'package:note_app/screens/screen_notes.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('Note App'),
          leading: Transform.scale(
            scale: 0.8,
            child: Image.asset('assets/images/notes-icon.png'),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => ScreenAddnote(
                      type: ActionType.addNote,
                    )));
          },
          backgroundColor: Colors.blueGrey,
          label: const Text('NEW'),
          icon: const Icon(Icons.add),
        ),
        body: const SafeArea(
          child: ScreenNotes(),
        ));
  }
}
