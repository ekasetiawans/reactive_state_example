import 'package:flutter/material.dart';

mixin Disposable {
  void dispose();
}

class Injector extends StatefulWidget {
  final List<dynamic> Function() create;
  final Widget child;
  const Injector({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  @override
  _InjectorState createState() => _InjectorState();

  static T of<T>(BuildContext context) {
    final injector = context.findAncestorStateOfType<_InjectorState>();
    if (injector != null) {
      for (var item in injector._itemsCache) {
        if (item is T) {
          return item;
        }
      }
    }

    throw Exception('Not found');
  }
}

class _InjectorState extends State<Injector> {
  late final List<dynamic> _itemsCache;
  @override
  void initState() {
    super.initState();
    _itemsCache = widget.create();
  }

  @override
  void dispose() {
    for (var item in _itemsCache) {
      if (item is Disposable) {
        item.dispose();
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
