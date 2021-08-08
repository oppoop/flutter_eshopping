import 'package:flutter_eshopping/data_model/product.dart';
import 'package:flutter_eshopping/screen/product/product_screen.dart';
import 'package:flutter_eshopping/screen/product/product_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eshopping/providers/favorite_notifier.dart';
import 'package:flutter_eshopping/providers/product_number_notifier.dart';
import 'package:flutter_eshopping/providers/product_size_notifier.dart';
class ProductTile extends StatelessWidget {
  const ProductTile({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        Navigator.push(context,MaterialPageRoute(
          builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider<FavoriteNotify>(
              create: (context) => FavoriteNotify(),
            ),
            ChangeNotifierProvider<ProductNumberNotifier>(
              create: (context) => ProductNumberNotifier(),
            ),
            ChangeNotifierProvider<ProductSizeNotifier>(
              create: (context) => ProductSizeNotifier(),
            ),
          ],
            child:ProductScreen(product: product),),
        ),);
      },
      child: Stack(
        children: [
          Column(
            children: [
              ProductImage(product: product),
              SizedBox(
                height: 8,
              ),
              Text(
                product.name!,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "\$${product.cost.toString()}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Theme.of(context).accentColor),
              )
            ],
          )
        ],
      ),
    );
  }
}