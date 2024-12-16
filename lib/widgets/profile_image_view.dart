import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';

class ProfileImageView extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final bool isCircle;
  final Widget? child;

  const ProfileImageView({
    super.key,
    required this.imageUrl,
    required this.size,
    this.isCircle = true,
    this.child,
  });

  Widget _defaultOrError(double realSize) {
    return Container(
      width: realSize,
      height: realSize,
      decoration: BoxDecoration(
        color: Colors.black26,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Icon(
        Icons.perm_identity,
        size: realSize - 2,
        color: Colors.black38,
      ),
    );
  }

  // ERROR:
  // https://github.com/Baseflow/flutter_cached_network_image/issues/995
  @override
  Widget build(BuildContext context) {
    double realSize = isCircle ? (size / sqrt(2)) : size;

    return imageUrl == null
        ? _defaultOrError(realSize)
        : CachedNetworkImage(
            width: realSize,
            height: realSize,
            imageUrl: imageUrl!,
            imageBuilder: (context, imageProvider) => Container(
              width: realSize,
              height: realSize,
              decoration: BoxDecoration(
                shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => _defaultOrError(realSize),
          );
  }
}
