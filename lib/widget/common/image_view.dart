import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;
  final Widget placeholder;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageView({
    Key? key,
    required this.imageUrl,
    required this.placeholder,
    this.width = 64,
    this.height = 64,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        return (progress == null)
            ? child
            : Center(
          child: SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: CircularProgressIndicator(
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded /
                    progress.expectedTotalBytes!
                    : null,
              ),
            ),
          ),
        );
      },
      errorBuilder: (context, exception, stackTrace) {
        return placeholder;
      },
    );
  }
}

class CircleImageView extends StatelessWidget {
  final String imageUrl;
  final Widget placeholder;
  final double width;
  final double height;
  final BoxFit fit;

  const CircleImageView({
    Key? key,
    required this.imageUrl,
    required this.placeholder,
    this.width = 64,
    this.height = 64,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ImageView(
        imageUrl: imageUrl,
        placeholder: placeholder,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}

class RoundedImageView extends StatelessWidget {
  final String imageUrl;
  final Widget placeholder;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const RoundedImageView({
    Key? key,
    required this.imageUrl,
    required this.placeholder,
    this.width = 64,
    this.height = 64,
    this.fit = BoxFit.contain,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: ImageView(
        imageUrl: imageUrl,
        placeholder: placeholder,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}