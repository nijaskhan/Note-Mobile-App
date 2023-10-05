import 'package:flutter/material.dart';
import 'package:note_app/data/note_item.dart';

class ScreenNotes extends StatelessWidget {
  const ScreenNotes({super.key});

  final content =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Neque aliquam vestibulum morbi blandit cursus risus at ultrices mi. Bibendum est ultricies integer quis auctor elit. Volutpat lacus laoreet non curabitur gravida. Condimentum lacinia quis vel eros donec ac odio tempor orci. Mattis aliquam faucibus purus in massa tempor. Vulputate sapien nec sagittis aliquam. Vestibulum lorem sed risus ultricies tristique nulla. At risus viverra adipiscing at. Leo vel orci porta non. Convallis convallis tellus id interdum velit laoreet id donec ultrices. Vitae nunc sed velit dignissim sodales ut eu sem integer. Mauris a diam maecenas sed enim ut sem viverra aliquet.";

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(20),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: List.generate(20, (index) {
        index = index + 1;
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(8),
          child: NoteItem(
            id: '11$index',
            title: 'Title $index',
            content: content,
          ),
        );
      }),
    );
  }
}
