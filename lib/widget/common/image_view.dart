import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String src;
  final Widget? errorWidget;
  final double width;
  final double height;
  final BoxFit fit;

  const ImageView(
    this.src, {
    Key? key,
    this.errorWidget,
    this.width = 64,
    this.height = 64,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Uri.tryParse(src) == null)  return errorWidget ?? Container();
    return Image.network(
      src,
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
        return errorWidget ?? Container();
      },
    );
  }
}

class CircleImageView extends StatelessWidget {
  final String src;
  final Widget? errorWidget;
  final double width;
  final double height;
  final BoxFit fit;

  const CircleImageView(
    this.src, {
    Key? key,
    this.errorWidget,
    this.width = 64,
    this.height = 64,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ImageView(
        src,
        errorWidget: errorWidget,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}

class RoundedImageView extends StatelessWidget {
  final String src;
  final Widget? errorWidget;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const RoundedImageView(
    this.src, {
    Key? key,
    this.errorWidget,
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
        src,
        errorWidget: errorWidget,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}