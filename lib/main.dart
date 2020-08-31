import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/host_app.dart';
import 'app/modules/login/credential_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => CredentialModel(), child: HostApp()));
}
