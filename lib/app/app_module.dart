import 'package:convex_app_bar_example/app1module.dart';
import 'package:app2/app2module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:host/app/modules/login/credential_model.dart';
import 'package:host/app/modules/login/login.dart';

import 'modules/home/home.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => CredentialModel()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => LoginWidget()),
    ChildRoute('/home', child: (_, __) => HomeWidget()),
    ModuleRoute('/convex_app_bar_example', module: App1Module()),
    ModuleRoute('/app2', module: App2Module()),
  ];
}
