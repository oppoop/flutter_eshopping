import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/favorite_notifier.dart';
import 'package:flutter_eshopping/data_model/product.dart';
import 'package:flutter_eshopping/temp_data.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_eshopping/utils/app_libs.dart';
import 'package:flutter_eshopping/screen/product/product_screen.dart';
import 'package:flutter_eshopping/screen/product/product_image.dart';
import 'package:flutter_eshopping/providers/product_number_notifier.dart';
import 'package:flutter_eshopping/providers/product_size_notifier.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(S().myFavorite, style: GoogleFonts.notoSerif().copyWith()),
        ],
      ),
    );
  }
}

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<Product> favoriteProduct = [];

  void _getFavoriteProduct() {
    products.map((e) {
      if (favoriteList.contains(e.productID)) {
        favoriteProduct.add(e);
      }
    }).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFavoriteProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteNotify>(
      builder: (
        context,
        favorite,
        child,
      ) {
        if (favoriteProduct.length == 0) {
          return Center(
            child: AppLibScreen.appText(
              text: S.current.emptyFavorite,
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: ListView.builder(
              itemCount: favoriteProduct.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider<ProductNumberNotifier>(
                                create: (context) => ProductNumberNotifier(),
                              ),
                              ChangeNotifierProvider<ProductSizeNotifier>(
                                create: (context) => ProductSizeNotifier(),
                              ),
                            ],
                            child: ProductScreen(product: favoriteProduct[index]),
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                            ),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 125,
                              child: ProductImage(
                                product: favoriteProduct[index],
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      favoriteProduct[index].name!,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                      child: Text(
                                    '\$ ${favoriteProduct[index].cost} ',
                                    style: GoogleFonts.notoSerif()
                                        .copyWith(color: Colors.red),
                                  )),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
