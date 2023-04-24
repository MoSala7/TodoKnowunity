import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_knowunity/models/note_model.dart';
import 'package:todo_knowunity/services/dio_client.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);
  DioClient dioClient = DioClient();

  final TextEditingController textFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<NoteModel>? notes;

  init() async {
    await dioClient.getNotes().then((value) => notes = value);
    emit(NoteInitialDone());
  }

  completeNote(int index) {
    emit(NoteCompletedStart());
    notes?[index].completed = true;
    emit(NoteCompletedDone());
  }

  deleteNote(int index) {
    emit(NoteDeleteStart());
    notes?.removeAt(index);
    emit(NoteDeleteDone());
  }

  addNote(String title) {
    emit(NoteAddStart());
    int? lastId = notes?.last.id;
    notes?.insert(0,
        NoteModel(userId: 0, id: lastId! + 1, title: title, completed: false));
    emit(NoteAddDone());

  }
}
