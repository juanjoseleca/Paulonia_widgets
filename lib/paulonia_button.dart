library paulonia_widgets;

import 'package:flutter/material.dart';
import 'package:paulonia_widgets/components/gradient_outlined_button.dart';
import 'package:paulonia_widgets/enums.dart';
import 'package:paulonia_widgets/utils/loading_overlay.dart';

class PauloniaButton<T> extends StatefulWidget {
  final Widget child;
  final Future<T> Function() onPressed;
  final Future<T> Function() onLongPressed;
  final LoadingButtonType loadingButtonType;
  final PauloniaButtonType pauloniaButtonType;
  final Widget loadingWidget;
  final double borderRadius;
  final Color color;
  final Gradient gradient;
  final double borderStrokeWidth;
  PauloniaButton(
      {@required this.child,
      @required this.onPressed,
      this.loadingWidget,
      this.color,
      this.onLongPressed,
      this.borderRadius,
      this.loadingButtonType = LoadingButtonType.none,
      this.pauloniaButtonType = PauloniaButtonType.elevated})
      : gradient = null,
        borderStrokeWidth = null;
  PauloniaButton.gradient({
    @required this.child,
    @required this.onPressed,
    this.loadingWidget,
    this.onLongPressed,
    this.borderRadius = 5,
    @required this.gradient,
    this.loadingButtonType = LoadingButtonType.none,
  })  : pauloniaButtonType = PauloniaButtonType.gradient,
        color = null,
        borderStrokeWidth = null;

  ///This button only works in Mobile
  PauloniaButton.outlinedGradient({
    @required this.child,
    @required this.onPressed,
    this.loadingWidget,
    this.onLongPressed,
    this.borderRadius = 5,
    this.borderStrokeWidth = 1,
    @required this.gradient,
    this.loadingButtonType = LoadingButtonType.none,
  })  : pauloniaButtonType = PauloniaButtonType.outlined_gradient,
        color = null;
  @override
  _PauloniaButtonState<T> createState() => _PauloniaButtonState<T>();
}

class _PauloniaButtonState<T> extends State<PauloniaButton<T>> {
  bool isLoading;
  final double _minButtonHeight = 36.0;
  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return isLoading
          ? Stack(
              children: [
                Center(
                  child: SizedBox(
                      height: constraints.hasTightHeight
                          ? constraints.maxHeight
                          : _minButtonHeight,
                      width: constraints.hasTightHeight
                          ? constraints.maxHeight
                          : _minButtonHeight,
                      child: CircularProgressIndicator(
                        valueColor: widget.color == null
                            ? null
                            : AlwaysStoppedAnimation<Color>(widget.color),
                      )),
                ),
              ],
            )
          : _getButtonType();
    });
  }

  Widget _getButtonType() {
    switch (widget.pauloniaButtonType) {
      case PauloniaButtonType.outlined_gradient:
        print('object');
        return GradientOutlinedButton(
            strokeWidth: widget.borderStrokeWidth,
            radius: widget.borderRadius,
            gradient: widget.gradient,
            child: widget.child,
            onPressed: onPressed);
      case PauloniaButtonType.gradient:
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              gradient: widget.gradient,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[500],
                  offset: Offset(0.0, 1.5),
                  blurRadius: 1.5,
                ),
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onPressed,
                onLongPress: onLongPress,
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                child: Center(child: widget.child)),
          ),
        );
      case PauloniaButtonType.elevated:
        return ElevatedButton(
            onLongPress: widget.onLongPressed == null ? null : onLongPress,
            onPressed: widget.onPressed == null ? null : onPressed,
            style: ButtonStyle(
                backgroundColor: widget.color == null ||
                        widget.onPressed == null ||
                        widget.onLongPressed == null
                    ? null
                    : MaterialStateProperty.all(Colors.red),
                shape: widget.borderRadius == null
                    ? null
                    : MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius)))),
            child: widget.child);
      case PauloniaButtonType.text:
        return TextButton(
            onLongPress: widget.onLongPressed == null ? null : onLongPress,
            onPressed: widget.onPressed == null ? null : onPressed,
            style: ButtonStyle(
                overlayColor: widget.color == null
                    ? null
                    : MaterialStateProperty.all(widget.color.withOpacity(0.2))),
            child: widget.child);
      case PauloniaButtonType.outlined:
        return OutlinedButton(
            onLongPress: widget.onLongPressed == null ? null : onLongPress,
            onPressed: widget.onPressed == null ? null : onPressed,
            style: ButtonStyle(
                overlayColor: widget.color == null
                    ? null
                    : MaterialStateProperty.all(widget.color.withOpacity(0.2))),
            child: widget.child);

      default:
        return Text('no type founded');
    }
  }

  void onPressed() {
    switch (widget.loadingButtonType) {
      case LoadingButtonType.none:
        widget.onPressed();
        break;

      case LoadingButtonType.local:
        if (isLoading == false) {
          setState(() {
            isLoading = true;
          });
        }
        widget.onPressed().then((value) {
          setState(() {
            isLoading = false;
          });
        });
        break;
      case LoadingButtonType.overlay:
        LoadingOverlay.of(context)
            .during(widget.onPressed(), widget.loadingWidget);
        break;
      default:
    }
  }

  void onLongPress() {
    switch (widget.loadingButtonType) {
      case LoadingButtonType.none:
        widget.onLongPressed();
        break;

      case LoadingButtonType.local:
        if (isLoading == false) {
          setState(() {
            isLoading = true;
          });
        }
        widget.onLongPressed().then((value) {
          setState(() {
            isLoading = false;
          });
        });
        break;
      case LoadingButtonType.overlay:
        LoadingOverlay.of(context)
            .during(widget.onLongPressed(), widget.loadingWidget);
        break;
      default:
    }
  }
}
