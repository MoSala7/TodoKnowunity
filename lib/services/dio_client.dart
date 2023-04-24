import 'package:dio/dio.dart';
import 'package:todo_knowunity/models/note_model.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  DioClient() {
    _dio
      ..options.baseUrl = _baseUrl
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
  }

  Future<List<NoteModel>> getNotes() async {
    List<NoteModel> notesData = [];
    Response data = await _dio.get('$_baseUrl/todos');

    for(int i = 0; i < data.data.length; i++){
      notesData.add(NoteModel.fromJson(data.data[i]));
    }

    return notesData;
  }
}