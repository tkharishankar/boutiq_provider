import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../themes/color_scheme.dart';
import 'app_images.dart';

mixin LoadingOverlayMixin {
  OverlayEntry showLoadingOverlay(
      BuildContext context, OverlayEntry? overlayEntry) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: LoadingAnimationWidget.threeRotatingDots(
                  size: 80,
                  color: AppColors.white100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    Overlay.of(context).insert(overlayEntry);
    return overlayEntry;
  }

  OverlayEntry hideLoadingOverlay(
      BuildContext context, OverlayEntry? overlayEntry) {
    overlayEntry?.remove();
    return overlayEntry!;
  }
}
