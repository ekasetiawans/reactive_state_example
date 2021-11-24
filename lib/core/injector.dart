import 'package:flutter/material.dart';

class Injector extends StatefulWidget {
  final List<dynamic> items;
  final Widget child;
  const Injector({
    Key? key,
    required this.items,
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
    _itemsCache = widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
