import 'package:flutter/material.dart';

class TeamIdProvider extends ChangeNotifier {
  String teamId = '';
  void changeId(String id) {
    teamId = id;
    notifyListeners();
  }
}
