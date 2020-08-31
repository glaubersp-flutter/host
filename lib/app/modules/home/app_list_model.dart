import 'dart:collection';

import 'package:app1/firstPage.dart';
import 'package:app2/app2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _AppListItem {
  final String key;
  final String version;
  final String name;

  const _AppListItem(this.key, this.version, this.name);
}

class AppListModel {
  List<_AppListItem> _items = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<_AppListItem> get items => UnmodifiableListView(_items);

  List<Widget> appListWidgets(BuildContext context) {
    return _items
        .map((_AppListItem e) => _infoTile(context, e.key, e.name, e.version))
        .toList(growable: false);
  }

  Widget _infoTile(
      BuildContext context, String key, String title, String version) {
    return ListTile(
      title: Text(title),
      subtitle: Text(version ?? 'Not set'),
      onTap: () {
        Navigator.push(context, appMaterialPageRoute(context, key));
      },
    );
  }

  void add(String key, String name, String version) {
    _items.add(_AppListItem(key, version, name));
  }

  MaterialPageRoute appMaterialPageRoute(BuildContext context, String title) {
    switch (title) {
      case 'app1':
        return MaterialPageRoute(
          builder: (context) {
            return FirstPage();
          },
        );
        break;
      case 'app2':
        return MaterialPageRoute(
          builder: (context) {
            return SecondPageWidget();
          },
        );
        break;
      default:
        return null;
    }
  }
}
