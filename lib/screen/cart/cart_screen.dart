import 'package:flutter_eshopping/data_model/order_item.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/cart_notifier.dart';
import 'package:flutter_eshopping/screen/product/call_action.dart';
import 'package:flutter_eshopping/screen/product/product_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'package:flutter_eshopping/providers/product_number_notifier.dart';

class CartScreen extends StatefulWidget {
  @override _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController _numController = TextEditingController();
  int? _sizeCurrent;

  _showDialog(BuildContext context,OrderItem item)async{
    _numController.text = item.selectedNum.toString();
    _sizeCurrent = item.product.sizes!.indexOf(item.selectedSize!);
    return await showDialog(
        context: context,
        builder:(context){
          return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: Container(
                height: MediaQuery.of(context).size.height*0.55,
                padding:EdgeInsets.symmetric(vertical:20,horizontal: 20 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[850]),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ProductImage(
                        product: item.product,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(item.product.name!,style: GoogleFonts.notoSerif().copyWith(color: Colors.white),),
                    Divider(color: Colors.grey[350],thickness: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(S().numEdit,style: GoogleFonts.notoSerif().copyWith(color: Colors.white),),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white,width: 1.5))),
                          child: TextFormField(
                            style: GoogleFonts.notoSerif().copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            controller: _numController,
                            onChanged:(String productNum){productNum = _numController.text;},
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:item.product.sizes!.map((e) {
                        int index = item.product.sizes!.indexOf(e);
                        return InkWell(
                          onTap: (){
                            setState(() {
                              _sizeCurrent = index;
                            });
                          },
                          child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 2),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width:1.5 ,
                                      color: _sizeCurrent == index
                                          ?Colors.indigoAccent.shade700:Colors.white
                                  )
                              ),
                              child: Center(
                                child: Text(item.product.sizes![index],
                                  style: GoogleFonts.notoSerif().copyWith(
                                      color: _sizeCurrent == index?Colors.indigoAccent.shade700:Colors.white
                                  ),),)
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed:(){
                        Navigator.pop(context);
                        context.read<CartNotifier>().remove(item);
                        context.read<CartNotifier>().add(
                          OrderItem(
                            product: item.product,
                            selectedSize: item.product.sizes![_sizeCurrent!],
                            selectedNum: int.parse(_numController.text),
                            productPrice: item.product.cost,
                            productCost:
                            item.product.cost! * int.parse(_numController.text),
                          ),
                        );

                      } ,
                      child: Text(S().submit),
                    ),
                  ],
                ),
              ),
            );
          });
        }
    );}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _numController.dispose();
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
                    '${S().size}:${item.selectedSize.toString()}',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Padding(padding:EdgeInsets.only(left: 10)),
                  Text(
                    '${S().number}:${item.selectedNum.toString()}',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
              Text(
                "\$" + item.productCost!.toStringAsFixed(2),
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
              onPressed: () => _showDialog(context,item),
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
        flexibleSpace: Container(
            decoration:BoxDecoration(
                gradient: LinearGradient(
                    colors:[Colors.indigo,Colors.purple],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft
                )
            )
        ),
        title: Column(
          children: [
            Text(S.current.cart),
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