import 'package:flutter/material.dart';
import 'package:users_list/domain/models/user_model.dart';
import '../../infrastructure/api_calls/get_all_users.dart';

class GetAllUsers extends ChangeNotifier {

    List<UserData>? datas;

    Future<List<UserData>?> getalldata() async {
    datas = await fetchData();
    notifyListeners();
    return datas;
  }
}