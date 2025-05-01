import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const CommonCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder:
          (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(height: height, width: width, color: Colors.white),
          ),
      errorWidget:
          (context, url, error) => Icon(
            Icons.image_not_supported,
            size: height ?? 50.0,
            color: Colors.grey,
          ),
    );
  }
}
