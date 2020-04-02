import 'dart:math';
import 'dart:ui';

import 'package:basqapp/progress_border_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAvatar extends StatefulWidget {
  CustomAvatar(this.photoPath, this.initials, this.showBorder,
      this.borderAnimationController, this.borderProgress);

  final String photoPath;
  final String initials;
  final bool showBorder;
  final double borderProgress;
  final AnimationController borderAnimationController;

  @override
  _CustomAvatarState createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  double _borderProgress;

  @override
  void initState() {
    if (widget.borderAnimationController == null)
      _borderProgress = widget.borderProgress;
    else
      widget.borderAnimationController.addListener(() {
        setState(() {
          _borderProgress = lerpDouble(
              0, widget.borderProgress, widget.borderAnimationController.value);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        foregroundPainter: ProgressBorderPainter(
            lineColor: Colors.white,
            completeColor: widget.showBorder ? Colors.lightGreen : Colors.white,
            completePercent: _borderProgress,
            width: 5.0),
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomCircleAvatar(
              myImage: NetworkImage(widget.photoPath),
              initials: widget.initials.toUpperCase(),
            )));
  }
}

class CustomCircleAvatar extends StatefulWidget {
  final NetworkImage myImage;
  final String initials;
  final double radius;

  CustomCircleAvatar({this.myImage, this.initials, this.radius});

  @override
  _CustomCircleAvatarState createState() => new _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  bool _checkLoading = true;
  Color _bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100;

  @override
  void initState() {
    _checkLoading = true;
    widget.myImage
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener(
      (info, call) {
        if (mounted)
          setState(() {
            _checkLoading = false;
          });
      },
    ));
  }


  @override
  void didUpdateWidget(CustomCircleAvatar oldWidget) {
    _checkLoading = true;
    widget.myImage
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener(
          (info, call) {
        if (mounted)
          setState(() {
            _checkLoading = false;
          });
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return _checkLoading == true
        ? new CircleAvatar(
            backgroundColor: _bgColor,
            radius: widget.radius,
            child: new Text(
              widget.initials,
              style: TextStyle(color: Colors.black),
            ))
        : new CircleAvatar(
            backgroundImage: widget.myImage,
      radius: widget.radius,
          );
  }
}
