import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import 'app_list_model.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppList();
  }
}

class AppList extends StatefulWidget {
  @override
  _AppListState createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  AppListModel _appListModel = AppListModel();

  @override
  void initState() {
    super.initState();
    _initAppListModel();
  }

  Future<void> _initAppListModel() async {
    var appListModel = await loadAppListModelEntries();
    setState(() {
      _appListModel = appListModel;
    });
  }

  Future<AppListModel> loadAppListModelEntries() {
    return DefaultAssetBundle.of(context)
        .loadString('assets/app_list.yaml')
        .then((String yamlFile) {
      YamlMap yaml = loadYamlNode(yamlFile);
      var appListModel = AppListModel();
      yaml.nodes.values.forEach((YamlNode value) {
        YamlMap appEntry = value.value;
        String appKey = appEntry.nodes['key'].toString();
        String appName = appEntry.nodes['name'].toString();
        String appVersion = appEntry.nodes['version'].toString();
        appListModel.add(appKey, appName, appVersion);
      });
      return appListModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("App list")),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: _appListModel.appListWidgets(context),
      ),
    );
  }
}
