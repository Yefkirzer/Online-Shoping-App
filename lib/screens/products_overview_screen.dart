import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mgt/providers/cart.dart';
import 'package:state_mgt/screens/cart_screen.dart';
import 'package:state_mgt/widgets/badge.dart';
import 'package:state_mgt/widgets/products_grid.dart';

enum FilterOptions { favorite, all }

class ProdutsOverviewScreen extends StatefulWidget {
  @override
  _ProdutsOverviewScreenState createState() => _ProdutsOverviewScreenState();
}

class _ProdutsOverviewScreenState extends State<ProdutsOverviewScreen> {
  var _isFavorite = false; //used to know when fav is taped
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: ((FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favorite) {
                    _isFavorite =
                        true; //we are doing this top pass this variable to the next widget or the grid widget
                    // so that we can filter favorites
                  } else {
                    _isFavorite = false;
                  }
                });
              }),
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.favorite,
                    ),
                    PopupMenuItem(
                      child: Text('All'),
                      value: FilterOptions.all,
                    ),
                  ]),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                //ch is the chilf ie. the ICon btn defined as a child bellow
                child: ch!,
                value: cart.quantity.toString(),
                color: Theme.of(context).accentColor),
            child: IconButton(
              //refered to the badge as ch
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(_isFavorite), //pass is favorite for further filtering
    );
  }
}
