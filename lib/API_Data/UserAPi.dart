import 'dart:convert';
import 'package:http/http.dart' as http;

Future getDataOfUserApi() async {
  http.Response response = await http.get('https://reqres.in/api/users/2');

  return jsonDecode(response.body);
}
