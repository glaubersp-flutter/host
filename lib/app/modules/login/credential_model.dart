import 'package:flutter/foundation.dart';

class CredentialModel extends ChangeNotifier {
  String email;
  String name;

  void setCredential(String email, String name) {
    this.email = email;
    this.name = name;
    notifyListeners();
  }
}
