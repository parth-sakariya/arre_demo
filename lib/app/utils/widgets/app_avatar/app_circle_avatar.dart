import 'package:arre_demo/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValueChanged<T, K> = void Function(T value, K value1);

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    required this.imgUrl,
    this.placeholderWidget,
    this.placeholderName,
    this.radius,
    this.width,
    this.height,
    this.fit,
  });

  final String imgUrl;
  final Widget? placeholderWidget;
  final String? placeholderName;
  final double? radius;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return getCircleImage(Image.asset(imgUrl).image);
  }

  Widget getCircleImage(ImageProvider image) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(fit: fit ?? BoxFit.fill, image: image))),
      ],
    ));
  }

  Widget getPlaceHolderImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 12),
      child: placeholderWidget ??
          Image.asset(
            placeholderName ?? Assets.assets_user_placeholder_png,
            fit: fit,
          ),
    );
  }
}