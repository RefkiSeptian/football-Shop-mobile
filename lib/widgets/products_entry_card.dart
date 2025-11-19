import 'package:flutter/material.dart';
import 'package:football_shop/models/products_entry.dart';

class ProductsEntryCard extends StatelessWidget {
  final ProductsEntry product;
  final VoidCallback onTap;

  const ProductsEntryCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          elevation: 2,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    'https://refki-septian-footballshop.pbp.cs.ui.ac.id//proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: const Center(child: Icon(Icons.broken_image)),
                    ),
                  ),
                ),

                 // Badge Featured di pojok kanan atas
                if (product.isFeatured)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Unggulan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
                const SizedBox(height: 8),
            

                // Title
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Brand
                Text('Brand: ${product.brand}'),
                const SizedBox(height: 6),

                // deskripsi preview
                Text(
                  product.description.length > 100
                      ? '${product.description.substring(0, 100)}...'
                      : product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

                // Featured indicator
                // if (product.isFeatured)
                //   const Text(
                //     'Featured',
                //     style: TextStyle(
                //       color: Colors.amber,
                //       fontWeight: FontWeight.bold
                //     ),
                //   ),
                
                // harga 
                Text(
                  'Rp ${product.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}