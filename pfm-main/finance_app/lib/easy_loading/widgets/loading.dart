import 'package:flutter/material.dart';

import './overlay_entry.dart';
import '../easy_loading.dart';

class FlutterEasyLoading extends StatefulWidget {
  final Widget? child;

  const FlutterEasyLoading({
    super.key,
    required this.child,
  })  : assert(child != null);

  @override
  _FlutterEasyLoadingState createState() => _FlutterEasyLoadingState();
}

class _FlutterEasyLoadingState extends State<FlutterEasyLoading> {
  late EasyLoadingOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = EasyLoadingOverlayEntry(
      builder: (BuildContext context) => EasyLoading.instance.w ?? Container(),
    );
    EasyLoading.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Material(
        child: Overlay(
          initialEntries: [
            EasyLoadingOverlayEntry(
              builder: (BuildContext context) {
                if (widget.child != null) {
                  return widget.child!;
                } else {
                  return Container();
                }
              },
            ),
            _overlayEntry,
          ],
        ),
      );
    } catch (e) {
      return Container();
    }
  }
}
