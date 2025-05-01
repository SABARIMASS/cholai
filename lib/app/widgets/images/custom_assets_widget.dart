import 'package:flutter/material.dart';

import '../../core/constants/image_assets.dart';

class CustomAssetWidget extends StatelessWidget {
  final double height;
  final double width;
  final String assetPath;
  final double radius;
  final String? errorImagePath;
  final BoxFit? fit;

  const CustomAssetWidget({
    super.key,
    required this.height,
    required this.width,
    required this.assetPath,
    this.radius = 10.0, // Default radius value
    this.errorImagePath,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        assetPath,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // If the asset fails to load, the error image will be shown
          return Image.asset(
            errorImagePath ?? Assets.noImages,
            height: height,
            width: width,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
