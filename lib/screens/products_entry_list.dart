import 'package:flutter/material.dart';
import 'package:football_shop/models/products_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/products_detail.dart';
import 'package:football_shop/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductsEntryListPage extends StatefulWidget {
  const ProductsEntryListPage({super.key});

  @override
  State<ProductsEntryListPage> createState() => _ProductsEntryListPageState();
}

class _ProductsEntryListPageState extends State<ProductsEntryListPage> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Fetch ALL products
  Future<List<ProductsEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('https://refki-septian-footballshop.pbp.cs.ui.ac.id//json/');
    
    var data = response;
    
    List<ProductsEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductsEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  // Fetch MY products (filter di backend)
  Future<List<ProductsEntry>> fetchMyProducts(CookieRequest request) async {
    final response = await request.get('https://refki-septian-footballshop.pbp.cs.ui.ac.id//json/data/my-products/');
    
    var data = response;
    
    List<ProductsEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductsEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'All Products'),
            Tab(text: 'My Products'),
          ],
        ),
      ),
      drawer: const LeftDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: All Products
          _buildProductList(request, filterType: 'all'),
          
          // Tab 2: My Products
          _buildProductList(request, filterType: 'my'),
        ],
      ),
    );
  }

  Widget _buildProductList(CookieRequest request, {required String filterType}) {
    return FutureBuilder(
      
      future: filterType == 'my' 
          ? fetchMyProducts(request)  
          : fetchProducts(request),   
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (!snapshot.hasData || snapshot.data.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_2_outlined, 
                    size: 80, 
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    filterType == 'my' 
                        ? 'Anda belum memiliki produk.' 
                        : 'Belum ada produk di football shop.',
                    style: const TextStyle(
                      fontSize: 20, 
                      color: Color(0xff59A5D8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (filterType == 'my')
                    const Text(
                      'Tambahkan produk pertama Anda!',
                      style: TextStyle(
                        fontSize: 14, 
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => ProductsEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsDetailPage(
                        products: snapshot.data![index],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }
      },
    );
  }
}