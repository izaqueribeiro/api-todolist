import 'dart:convert';
import 'dart:io';
import 'dados.dart';

final baseUrl = URI().main;

class URI {
  final String main = 'https://todolist-api.edsonmelo.com.br/';
}

// VISUALISAR TAREFAS
class TasksService {
  static Future getTasks() async {
    final client = HttpClient();

    return await client
        .postUrl(Uri.parse('$baseUrl/api/task/search/'))
        .then((HttpClientRequest request) async {
      request.headers.add(
        'Content-type',
        'application/json',
      );
      request.headers.add(
        'Authorization',
        '2CB7B9CA512938843247',
      );

      return request.close();
    });
  }

  // NOVA TAREFA
  static Future newTask(String taskname) async {
    final client = HttpClient();
    return await client
        .postUrl(Uri.parse('$baseUrl/api/task/new/'))
        .then((HttpClientRequest request) async {
      request.headers.add(
        'Content-type',
        'application/json',
      );
      request.headers.add(
        'Authorization',
        '2CB7B9CA512938843247',
      );
      final body = jsonEncode({
        "name": taskname,
      });

      request.write(body);
      return request.close();
    });
  }

  // ATUALIZAR TAREFA
  static Future updateTask(Task task) async {
    final client = HttpClient();
    return await client
        .putUrl(Uri.parse('$baseUrl/api/task/update/'))
        .then((HttpClientRequest request) async {
      request.headers.add(
        'Content-type',
        'application/json',
      );
      request.headers.add(
        'Authorization',
        '2CB7B9CA512938843247',
      );
      final body = jsonEncode({
        "id": task.id,
        "name": task.name,
        "realized": task.realized,
      });

      request.write(body);
      return request.close();
    });
  }

  // DELETAR TAREFA
  static Future deleteTask(int taskId) async {
    final client = HttpClient();
    return await client
        .deleteUrl(Uri.parse('$baseUrl/api/task/delete/'))
        .then((HttpClientRequest request) async {
      request.headers.add(
        'Content-type',
        'application/json',
      );
      request.headers.add(
        'Authorization',
        '2CB7B9CA512938843247',
      );
      final body = jsonEncode({
        "id": taskId,
      });

      request.write(body);
      return request.close();
    });
  }
}
