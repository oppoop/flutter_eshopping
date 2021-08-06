import 'package:flutter_eshopping/data_model/category.dart';
import 'package:flutter_eshopping/data_model/product.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/cart_notifier.dart';
import 'package:flutter_eshopping/screen/cart/app_bar.dart';
import 'package:flutter_eshopping/data_model/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/temp_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/model/textfied_look.dart';
import 'call_action.dart';
import 'product_support.dart';
import 'package:flutter_eshopping/providers/favorite_notifier.dart';
import 'package:flutter_eshopping/providers/product_number_notifier.dart';
import 'package:flutter_eshopping/providers/product_size_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_details.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({required this.product});
  final Product product;
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  bool _pageChange = false;
  bool? _favoriteStatus=false;
  bool? _categoryType;
  String? selectedImageUrl;
  String? selectedSize;
  String _sizeValue="";
  String? get sizeValue => _sizeValue;
  TextEditingController _numController = TextEditingController();
  final _productScreenScaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    checkCategory();
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

  void checkCategory(){
    if(product.category == petCategory)
      {_categoryType = false;}
    else
      {_categoryType = true;}
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

  _productSizeSheet(BuildContext context){
    _productScreenScaffold.currentState!.showBottomSheet((context)
    {
      return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
        return Container(
          color: Colors.grey[700],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: product.sizes!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(product.sizes![index],style:GoogleFonts.notoSerif().copyWith(color: Colors.black),),
                        leading: Radio<String>(
                          groupValue: _sizeValue,
                          value: product.sizes![index],
                          onChanged: (value){
                            setState(() {
                              Provider.of<ProductSizeNotifier>(context,listen: false).sizeSelect(sizeValue: _sizeValue);
                              _sizeValue = product.sizes![index];
                              print(_sizeValue);
                            });
                          },
                        ),
                    );
                  }),
              Divider(height: 10,color: Colors.grey[300],thickness: 5,),
              SizedBox(height: 10,),
              ElevatedButton(onPressed:()=>Navigator.pop(context), child: Text('確認'),)
            ],
          ),
        );
      });
    }
    );
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
      key: _productScreenScaffold,
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
                child: Center(
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
                      /*Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagePreviews,
                    ),*/
                    ],
                  ),
                )
              ),
              IconButton(
                  onPressed: () async{
                    setState(() {
                      _favoriteStatus = !_favoriteStatus!;
                      if(_favoriteStatus!){
                        Provider.of<FavoriteNotify>(context,listen: false).favoriteAdd(product.productID!);}
                      else{
                        Provider.of<FavoriteNotify>(context,listen: false).favoriteRemove(product.productID!);
                      }
                    });
                  },
                  icon: _favoriteStatus!
                      ? Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                      : Icon(Icons.favorite_border,color: Colors.pink,))
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
                          child:Consumer<ProductSizeNotifier>(
                            builder: (
                                context,
                                size,
                                _,
                                ) {
                              return InkWell(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    size.sizeStatus
                                    ?Text(_sizeValue)
                                    :Text(S().chooseSize,style: GoogleFonts.notoSerif(),),
                                    Icon(Icons.arrow_drop_down,size:30,),
                                  ]
                              ),
                                onTap:()=>_productSizeSheet(context),
                              );
                            },
                          ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _categoryType!?Row(
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
                                S().productDetails,
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
                                S().modelSize,
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
                    ):Center(
                      child: Text(
                        S().productDetails,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                    _pageChange
                        ?productModelSize(modelSizeLength: product.modelSize!.length, modelSizeLeading: modelSize, modelSizeList: product.modelSize)
                        :productDetails(detailLength: product.details!.length, detailList: product.details),
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
                      textAlign: TextAlign.center,
                      controller: _numController,
                      onChanged:(String productNum){if(productNum != ""){num.setNumber(productNumber: _numController.text);}},
                      keyboardType: TextInputType.number,
                      decoration:sizeInputDecoration(),
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
