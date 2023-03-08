import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> createPostRequest(Map<dynamic, dynamic> body) async {
  //you can check connection and other things here later
  return await http.post(
    Uri.parse(''),
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode(body),
    encoding: Encoding.getByName("utf-8"),
  );
}
