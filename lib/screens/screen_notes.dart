// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:note_app/data/data.dart';
import 'package:note_app/data/note_item.dart';
import 'package:note_app/data/note_model/note_model.dart';

class ScreenNotes extends StatefulWidget {
  const ScreenNotes({super.key});

  @override
  State<ScreenNotes> createState() => _ScreenNotesState();
}

class _ScreenNotesState extends State<ScreenNotes> {

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NoteApi().getAllNotes();
    });
    return ValueListenableBuilder(
        valueListenable: NoteApi().noteListNotifier,
        builder: (context, List<NoteModel> newNotes, _) {
          return GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: List.generate(newNotes.length, (index) {
              final _note = newNotes[index];
              if (_note.id == null) {
                return const SizedBox();
              }
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: NoteItem(
                  id: _note.id!,
                  title: _note.title!,
                  content: _note.content!,
                ),
              );
            }),
          );
        });
  }
}
