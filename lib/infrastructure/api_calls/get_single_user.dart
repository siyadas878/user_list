import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:users_list/domain/models/single_user.dart';

Future<UserModel> getSingleUserData(String id) async {
  int dataId= int.parse(id);
  final response = await http.get(Uri.parse("https://dummyjson.com/users/$dataId"));
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonDataMap = json.decode(response.body);
    final UserModel data = UserModel.fromJson(jsonDataMap);
    return data;
  } else {
    throw Exception(
        "Failed to retrieve data. Status code: ${response.statusCode}");
  }
}
