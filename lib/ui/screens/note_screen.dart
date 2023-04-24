import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_knowunity/controllers/note_cubit.dart';
import 'package:todo_knowunity/ui/widgets/text_dialog.dart';

import '../widgets/notes_widget.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  Widget _buildBodyContent(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        NoteCubit cubit = NoteCubit.get(context);

        return RefreshIndicator(
          onRefresh: (){
            cubit.init();
            return Future<bool>.value(true);
          },
          child: Scaffold(
            appBar: AppBar(title: const Text("My Notes")),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: NotesWidget(),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .miniEndFloat,
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                displayTextInputDialog(context, cubit);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyContent(context);
  }


}


