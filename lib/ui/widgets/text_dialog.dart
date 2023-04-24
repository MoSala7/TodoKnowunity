import 'package:flutter/material.dart';
import 'package:todo_knowunity/controllers/note_cubit.dart';

Future<void> displayTextInputDialog(BuildContext context, NoteCubit cubit) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Form(
        key: cubit.formKey,
          child:
       AlertDialog(
        title: const Text('Add note'),
        content: TextFormField(
          controller: cubit.textFieldController,
          decoration: const InputDecoration(
            hintText: "Note title",
            labelText: 'Add some information',
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Text is empty';
            }
            return null;
          },
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.addNote(cubit.textFieldController.text);
                cubit.textFieldController.clear();
                Navigator.pop(context);
              }
            }
          ),
        ],
      ));
    },
  );
}