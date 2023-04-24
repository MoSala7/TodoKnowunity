part of 'note_cubit.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}
class NoteInitialDone extends NoteState {}

class NoteCompletedStart extends NoteState {}
class NoteCompletedDone extends NoteState {}

class NoteDeleteStart extends NoteState {}
class NoteDeleteDone extends NoteState {}

class NoteAddStart extends NoteState {}
class NoteAddDone extends NoteState {}
