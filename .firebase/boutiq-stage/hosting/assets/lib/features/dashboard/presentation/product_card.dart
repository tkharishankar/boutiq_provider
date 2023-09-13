import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Card(
      elevation: 2.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ListTile(
            title: Text(
              productName,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(brandName),
            trailing: IconButton(
              icon: isFavorited
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border),
              onPressed: () {
                // Handle favorite action here
              },
            ),
          ),

          // Product Image (CachedNetworkImage)
          Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 100.0,
              height: 100.0,
              // Adjust the height as needed
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              // Placeholder while loading
              errorWidget: (context, url, error) =>
                  Icon(Icons.error), // Error widget
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 16.0),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
