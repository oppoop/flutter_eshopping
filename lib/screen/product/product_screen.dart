import 'package:flutter_eshopping/data_model/category.dart';
import 'package:flutter_eshopping/data_model/product.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/cart_notifier.dart';
import 'package:flutter_eshopping/screen/cart/app_bar.dart';
import 'package:flutter_eshopping/data_model/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'call_action.dart';
import 'product_support.dart';
import 'package:flutter_eshopping/providers/favorite_notifier.dart';
import 'package:flutter_eshopping/providers/product_number_notifier.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({required this.product});
  final Product product;
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  bool _pageChange = false;
  bool _favoriteStatus = false;
  String? selectedImageUrl;
  String? selectedSize;
  String? _sizeValue;
  String? get sizeValue => _sizeValue;
  TextEditingController _numController = TextEditingController();

  @override
  void initState() {
    selectedImageUrl = product.imageUrls!.first;
    selectedSize = product.sizes?.first;
    super.initState();
    _numController.text="1";
  }

  @override
  void dispose() {
    _numController.dispose();
    super.dispose();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  List<Product> filterProducts({
    required List<Product> products,
    required Category category,
  }) {
    return products
        .where(
          (e) => e.category == category && e.name != widget.product.name,
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imagePreviews = product.imageUrls!
        .map(
          (url) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () => setSelectedImageUrl(url),
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              border: selectedImageUrl == url
                  ? Border.all(
                  color: Theme.of(context).accentColor, width: 1.75)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              url,
            ),
          ),
        ),
      ),
    )
        .toList();

    return Scaffold(
      appBar: AppBar(
        actions: [
          CartAppBarAction(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .30,
                color: Colors.grey[200],
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        selectedImageUrl!,
                        fit: BoxFit.cover,
                        color: Colors.grey[200],
                        colorBlendMode: BlendMode.multiply,
                      ),
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagePreviews,
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () async{
                    setState(() {
                      _favoriteStatus = !_favoriteStatus;
                      if(_favoriteStatus){
                        Provider.of<FavoriteNotify>(context,listen: false).favoriteAdd(product.productID!);}
                      else{
                        Provider.of<FavoriteNotify>(context,listen: false).favoriteRemove(product.productID!);
                      }
                    });
                  },
                  icon: _favoriteStatus
                      ? Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                      : Icon(Icons.favorite_border))
            ],
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          product.name!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "\$" + product.cost.toString(),
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Center(
                      child: Container(
                          padding:EdgeInsets.only(left: 5,right: 5),
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 35,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 0.5)),
                          child: InkWell(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_down,size:30,),
                              ]
                          ),
                            onTap: (){
                              Scaffold.of(context).showBottomSheet((BuildContext context)=> Container(),);
                            },)
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
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
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemExtent: 40,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(' - '),
                            title: Text(product.details![index]),
                          );
                        }),
                    SizedBox(height: 10,),
                    Container(color: Colors.grey,height: 15,),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemExtent: 40,
                      children: productSupport,
                    )
                  ],
                ),
              ))
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<ProductNumberNotifier>(builder: (context,num,_){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed:()=>num.minusNumber(productNumber: _numController.text), icon: Icon(Icons.remove)),
                  SizedBox(
                    height: 50,
                    width: 70,
                    child: TextFormField(
                      controller: _numController,
                      onChanged:(String productNum){if(productNum != ""){num.setNumber(productNumber: _numController.text);}},
                      keyboardType: TextInputType.number,
                      decoration: buildInputDecoration(null,'數量',"",false,),
                    ),
                  ),
                  IconButton(onPressed: ()=>num.plusNumber(productNumber: _numController.text), icon: Icon(Icons.add)),
                ],
              );
            },),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: CallToActionButton(
                onPressed: () {
                  context.read<CartNotifier>().add(
                    OrderItem(
                      product: product,
                      selectedSize: _sizeValue,
                      selectedNum: int.parse(_numController.text),
                      totalCost:
                      product.cost! * int.parse(_numController.text),
                    ),
                  );
                  print(_sizeValue);
                  print(int.parse(_numController.text));
                },
                labelText: S.current.addToCart,
              ),
            )
          ],
        ),
      ),
    );
  }
}
