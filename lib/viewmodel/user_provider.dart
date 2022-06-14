import 'package:flutter/cupertino.dart';
import 'package:myproject/models/user_model.dart';
import 'package:myproject/services/user_service.dart';

enum PageState { LOADING, SUCCES, IDLE }

class UserProvider with ChangeNotifier {
  late Users user;
  late Userservice service;
  late PageState _pageState;
  PageState get pageState => _pageState;
  set pageState(PageState value) {
    _pageState = value;
    notifyListeners();
  }

  UserProvider() {
    pageState = PageState.IDLE;
    user = Users();
    service = Userservice();
    getUsers();
  }

  Future<void> getUsers() async {
    pageState = PageState.LOADING;
    user = await service.getUsers('2');
    pageState = PageState.SUCCES;
  }
}
