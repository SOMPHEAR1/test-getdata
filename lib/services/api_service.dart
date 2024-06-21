// services/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:data_from_internet/models/post.dart';

class ApiService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse(apiUrl));
    
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw 'Failed to load posts';
    }
  }
}
