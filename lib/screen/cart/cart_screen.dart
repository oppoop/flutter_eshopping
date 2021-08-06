import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/cart_notifier.dart';
import 'package:flutter_eshopping/screen/product/call_action.dart';
import 'package:flutter_eshopping/screen/product/product_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _pageChange = false;
  _showDialog(BuildContext context)async{
    return await showDialog(
      context: context,
      builder:(context){
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color: _pageChange
                              ? Colors.grey
                              : Colors.black))),
              child: InkWell(
                child: Center(
                  child: Text(
                    '詳情',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(
                        fontSize: 15,
                        color: _pageChange
                            ? Colors.grey
                            : Colors.black),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _pageChange = !_pageChange;
                  });
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border(
                      bottom: BorderSide(
                          width: 2,
                          color: _pageChange
                              ? Colors.black
                              : Colors.grey))),
              child: InkWell(
                child: Center(
                  child: Text(
                    '尺寸',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(
                        fontSize: 15,
                        color: _pageChange
                            ? Colors.black
                            : Colors.grey),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _pageChange = !_pageChange;
                  });
                },
              ),
            ),
          ],
        );
    }
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    List<Widget> orderItemRows = context.watch<CartNotifier>().itemsInCart
        .map((item) => Row(
      children: [
        SizedBox(
          width: 125,
          child: ProductImage(
            product: item.product,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.product.name!,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '尺寸:'+item.selectedSize.toString(),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Padding(padding:EdgeInsets.only(left: 10)),
                  Text(
                    '數量:'+item.selectedNum.toString(),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              Text(
                "\$" + item.totalCost!.toStringAsFixed(2),
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.mode_edit),
              onPressed: () => _showDialog(context),
              color: Colors.green[800],
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => context.read<CartNotifier>().remove(item),
              color: Colors.red,
            )
          ],
        ),
      ],
    ),
    ).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(S.current.cart),
            Text(
              S.current.cartItems(context.watch<CartNotifier>().itemsInCart.length.toString()),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          if (orderItemRows != null && orderItemRows.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: orderItemRows.length,
                itemBuilder: (_, index) => orderItemRows[index],
                separatorBuilder: (_, index) => SizedBox(
                  height: 16,
                ),
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text(S.current.emptyCart),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.total,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      "\$" + context.watch<CartNotifier>().totalCost.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
                CallToActionButton(
                  onPressed: () {},
                  labelText: S.current.checkOut,
                  minSize: Size(220, 45),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}