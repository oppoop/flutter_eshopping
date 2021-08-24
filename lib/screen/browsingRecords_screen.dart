import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_eshopping/data_model/product.dart';
import 'package:flutter_eshopping/temp_data.dart';
import 'package:flutter_eshopping/providers/browsing_notifier.dart';
import 'package:flutter_eshopping/providers/product_number_notifier.dart';
import 'package:flutter_eshopping/providers/product_size_notifier.dart';
import 'package:flutter_eshopping/screen/product/product_screen.dart';
import 'package:flutter_eshopping/screen/product/product_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/utils/app_libs.dart';

class BrowsingRecordsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(S().browsingRecords,style: GoogleFonts.notoSerif()
              .copyWith()),
        ],
      ),
    );
  }
}

class BrowsingRecord extends StatefulWidget{
  @override
  _BrowsingRecordState createState() => _BrowsingRecordState();
}
class _BrowsingRecordState extends State<BrowsingRecord> {
  List<Product> browsingRecordProduct = [];

  void _getBrowsingRecordProduct() {
    products.map((e) {
      if (browsingRecordList.contains(e.productID)) {
        browsingRecordProduct.add(e);
      }
    }).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBrowsingRecordProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BrowsingRecordNotify>(
      builder: (
          context,
          browsing,
          child,
          ) {
        if (browsingRecordList.length == 0) {
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
              itemCount: browsingRecordList.length,
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
                            child: ProductScreen(product: browsingRecordProduct[index]),
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
                                product: browsingRecordProduct[index],
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
                                      browsingRecordProduct[index].name!,
                                      style:
                                      Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                      child: Text(
                                        '\$ ${browsingRecordProduct[index].cost} ',
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
