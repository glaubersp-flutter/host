import 'package:app2/app2.dart';
import 'package:convex_app_bar_example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:host/app/modules/login/credential_model.dart';
import 'package:host/app/modules/login/login.dart';

import 'app_widget.dart';
import 'modules/home/home.dart';

class AppModule extends MainModule {
  static Inject get to => Inject<AppModule>.of();

  @override
  List<Bind> get binds => [Bind((_) => CredentialModel())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => LoginWidget()),
        ModularRouter('/home', child: (_, __) => HomeWidget()),
        ModularRouter('/app1', module: App1Module()),
        ModularRouter('/app2', module: App2Module()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
