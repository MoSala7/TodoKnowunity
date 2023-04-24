import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_knowunity/controllers/note_cubit.dart';
import 'package:todo_knowunity/models/note_model.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        NoteCubit cubit = NoteCubit.get(context);

        if (cubit.notes == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (cubit.notes?.isEmpty == null && state is NoteInitialDone) {
          return const Center(child: Text("Please add a note"));
        }

        return ListView.builder(
          itemCount: cubit.notes?.length,
          itemBuilder: (BuildContext context, int index) {
            NoteModel note = cubit.notes![index];
            bool completed = note.completed ?? false;
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                cubit.deleteNote(index);
              },
              background: Container(color: Colors.red),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                margin: const EdgeInsets.symmetric(vertical: 5),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200]),
                child: ListTile(
                  style: ListTileStyle.drawer,
                  title: Text(note.title ?? ""),
                  leading: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.notes),
                  ),
                  enabled: !completed,
                  trailing: IconButton(
                    icon: completed
                        ? const Icon(Icons.check_box_outlined)
                        : const Icon(Icons.check_box_outline_blank_sharp),
                    onPressed: () {
                      if (!completed) {
                        cubit.completeNote(index);
                      }
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
