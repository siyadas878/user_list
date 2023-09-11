import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/user_model.dart';

Future<List<UserData>> fetchData() async {
  try {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/users?limit=10&skip=0'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> jsonData = responseData['users'];
      final List<UserData> resultList =
          jsonData.map((data) => UserData.fromJson(data)).toList();
      return resultList;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
