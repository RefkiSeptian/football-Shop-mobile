import 'package:flutter/material.dart';
import 'package:football_shop/models/products_entry.dart';
import 'package:football_shop/models/products_entry.dart';

class ProductsDetailPage extends StatelessWidget {
  final ProductsEntry products;

  const ProductsDetailPage({super.key, required this.products});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (products.thumbnail.isNotEmpty)
              Container(
              width: double.infinity,
              height: 250,
              color: Colors.white, // ← Background putih
              child: Image.network(
                'https://refki-septian-footballshop.pbp.cs.ui.ac.id//proxy-image/?url=${Uri.encodeComponent(products.thumbnail)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.white, // ← Ubah juga error builder jadi putih
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured badge
                  if (products.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Unggulan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),

                  // Title
                  Text(
                    products.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  
                  Row(
                    children: [
                      Text(
                        'RP ${products.price}',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Stok
                  Row(
                    children: [
                      const SizedBox(width: 4),
                      Text(
                        '${products.stok} stok',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  
                  const Divider(height: 32),

                  // Full content
                  Text(
                    products.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}