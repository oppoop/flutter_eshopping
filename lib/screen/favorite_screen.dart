import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/favorite_notifier.dart';
import 'package:flutter_eshopping/screen/product/product_row.dart';
import 'package:flutter_eshopping/data_model/product.dart';
import 'package:flutter_eshopping/temp_data.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
class FavoriteBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(S().myFavorite,style: GoogleFonts.notoSerif()
              .copyWith()),
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
  late List<Product> _favorite;
  void getFavoriteRow(){
    for(int i=0;i<favoriteList.length;i++){
      _favorite = products.where((p) =>p.productID == favoriteList[i]).toList();
    }
  }

  
  @override
  Widget build(BuildContext context) {
    /*
    List<ProductRow> favoriteRows = favoriteList
        .map((s) => ProductRow(
      productID: s,
      products: products
          .where((p) => p.productID!.toLowerCase() == s.toLowerCase())
          .toList(),
    ))
        .toList();*/

    return Container();
  }

}
