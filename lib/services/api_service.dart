// services/api_service.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:data_from_internet/models/post.dart';

class ApiService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  final Dio _dio = Dio();

  Future<List<Post>> getPosts() async {
    try {
      final response = await _dio.get(apiUrl);

      if (response.statusCode == 200) {
        List<dynamic> body = response.data;
        List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
        return posts;
      } else {
        throw 'Failed to load posts';
      }
    } catch (error) {
      throw 'Failed to load posts: $error';
    }
  }
}
