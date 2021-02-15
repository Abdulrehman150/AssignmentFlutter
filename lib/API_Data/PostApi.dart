import 'dart:convert';
import 'package:http/http.dart' as http;

Future getDataofPostApi() async {
  http.Response response =
      await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
  } else {
    print(response.statusCode);
  }
  return jsonDecode(response.body);
}
