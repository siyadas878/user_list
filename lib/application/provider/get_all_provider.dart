import 'package:flutter/material.dart';
import 'package:users_list/domain/models/single_user.dart';
import 'package:users_list/domain/models/user_model.dart';
import 'package:users_list/infrastructure/api_calls/get_single_user.dart';
import '../../infrastructure/api_calls/get_all_users.dart';

class GetAllUsers extends ChangeNotifier {

    List<UserData>? datas;

    Future<List<UserData>?> getalldata(int skip) async {
    datas = await fetchData(skip);
    notifyListeners();
    return datas;
  }

  Future<UserModel> getUserData(String id) async{
     UserModel data= await getSingleUserData(id);
     notifyListeners();
     return data;
  }
}