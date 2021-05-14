import 'dart:collection';

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
        // Modular.to.pushNamed('/login');
        Navigator.pushNamed(context, key);
      },
    );
  }

  void add(String key, String name, String version) {
    _items.add(_AppListItem(key, version, name));
  }
}
