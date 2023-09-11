import 'package:flutter/foundation.dart';
import 'package:users_list/domain/models/user_model.dart';
import 'package:users_list/application/provider/get_all_provider.dart';

class UserListProvider extends ChangeNotifier {
  List<UserData> _userList = [];
  int _skip = 0;

  List<UserData> get userList => _userList;

  Future<void> loadMoreData() async {
    final List<UserData>? newData = await GetAllUsers().getalldata(_skip + 10);
    if (newData != null) {
      _userList.addAll(newData);
      _skip += 10;
      notifyListeners();
    }
  }

  Future<void> getAllData() async {
    final List<UserData>? data = await GetAllUsers().getalldata(_skip + 10);
    if (data != null) {
      _userList = data;
      _skip += 10;
      notifyListeners();
    }
  }
}
