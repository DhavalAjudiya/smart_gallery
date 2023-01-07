import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final Widget? child;
  final DecorationImage? image;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final Gradient? gradient;
  final GestureTapCallback? onTap;

  AppContainer({
    Key? key,
    this.margin,
    this.width,
    this.height,
    this.child,
    this.image,
    this.color,
    this.borderRadius,
    this.boxShadow,
    this.border,
    this.gradient,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        height: height,
        width: width,
        child: child,
        decoration: BoxDecoration(
          image: image,
          color: color,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          border: border,
          gradient: gradient,
        ),
      ),
    );
  }
}
