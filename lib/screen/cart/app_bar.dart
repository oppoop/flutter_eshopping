import 'package:flutter_eshopping/providers/cart_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';

class CartAppBarAction extends StatefulWidget {
  @override
  _CartAppBarActionState createState() => _CartAppBarActionState();
}

class _CartAppBarActionState extends State<CartAppBarAction> {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
          ),
          if (context.watch<CartNotifier>().itemsInCart.length > 0)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        context.watch<CartNotifier>().itemsInCart.length.toString(),
                        style: TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      onPressed: () =>Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CartScreen(),
        ),
      ),
    );
  }
}