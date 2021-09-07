import 'package:flutter/material.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  bool? showFavs; // to recive favorite from previous widget
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs!
        ? productsData.favoriteItems
        : productsData.items; // Use the passed argument inorder
    // to further filter what we display on the body
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            // create: (context) => products[index],
            value: products[index],
            child: ProductItem(),
          );
        });
  }
}
