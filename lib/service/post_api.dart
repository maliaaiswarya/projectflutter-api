import 'dart:convert';
import 'package:helloworld1/model/post.dart';
import 'package:http/http.dart' as http;

class PostApi {
  static Future<List<Post>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => Post.fromJson(e)).toList();
}
}