import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/themes/color_scheme.dart';
import '../../../../router/router.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String brandName;
  final double price;
  final double rating;
  final bool isFavorited;
  final String imageUrl;

  ProductCard({
    required this.productName,
    required this.brandName,
    required this.price,
    required this.rating,
    required this.isFavorited,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushReplacementNamed(RouteConstants.productDetail);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            posterImageView(imageUrl),
            ratingView(productName),
          ],
        ),
      ),
    );
  }

  Positioned ratingView(String productName) {
    return Positioned(
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.transparentWhite,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
            border: Border.all(
              color: AppColors.transparentWhite,
              width: 0.05,
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
        ),
      ),
    );
  }

  ClipRRect posterImageView(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        fit: BoxFit.fill,
        imageUrl,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
