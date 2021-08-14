import 'package:flutter_eshopping/data_model/product.dart';
import 'package:flutter_eshopping/data_model/category.dart';
import 'package:flutter_eshopping/screen/cart/app_bar.dart';
import 'package:flutter_eshopping/screen/product/product_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../temp_data.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({this.category});
  final Category? category;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

enum Filters { popular, recent, sale }

class _CategoryScreenState extends State<CategoryScreen> {
  Category? get category => widget.category;
  //Filters filterValue = Filters.popular;
  //String selection;
  late List<Product> _products;

  @override
  void initState() {
    //selection = category.selections?.first;
    _products = products.where((p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductRow> productRows = category!.selections!
        .map((s) => ProductRow(
      productType: s,
      products: _products
          .where((p) => p.productType!.toLowerCase() == s.toLowerCase())
          .toList(),
    ))
        .toList();
    return DefaultTabController(
      length: productRows.length,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(category!.title),
            bottom: TabBar(
                tabs:productRows.map((e) => Tab(text: e.productType,)).toList()
            ),
            actions: [
              CartAppBarAction(),
            ],
            flexibleSpace: Container(
                decoration:BoxDecoration(
                    gradient: LinearGradient(
                        colors:[Colors.indigo,Colors.purple],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    )
                )
            ),
          ),
          body: TabBarView(
            children:productRows,
          )
        /*ListView.separated(
          padding: EdgeInsets.symmetric(vertical:18),
          itemCount: productRows.length,
          itemBuilder: (_, index) => productRows[index],
          separatorBuilder: (_, index) => SizedBox(
            height: 18,
          ),
        ),*/
      ),
    );
  }
}