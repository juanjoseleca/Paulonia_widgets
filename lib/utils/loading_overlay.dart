import 'package:flutter/material.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show(Widget loadingWidget) {
    showDialog(
      context: _context,
      builder: (context) => _FullScreenLoader(
        loadingWidget: loadingWidget,
      ),
    );
  }

  Future<T> during<T>(Future<T> future, Widget loadingWidget) {
    show(loadingWidget);
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  final Widget loadingWidget;
  _FullScreenLoader({@required this.loadingWidget});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: Center(child: loadingWidget ?? CircularProgressIndicator()));
  }
}
