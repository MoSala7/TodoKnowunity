// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class NoteModel extends Equatable{
  int? userId;
  int? id;
  String? title;
  bool? completed;

  NoteModel({this.userId, this.id, this.title, this.completed});

  @override
  List<Object?> get props => [id, userId, completed, title];

  NoteModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}