import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/custom_service_notifier.dart';
import 'package:flutter_eshopping/utils/pop_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomerCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customService(context: context),
    );
  }

  Widget _customService({required BuildContext context}) {
    return Consumer<CustomServiceNotify>(builder: (context, controller, _) {
      return SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.pink, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_ios))),
                    Container(
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        '問題回報',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                ).paddingOnly(top: 30),
              ),
              Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(3.0, 3.0), //陰影y軸偏移量
                              blurRadius: 5, //陰影模糊程度
                              spreadRadius: 1 //陰影擴散程度
                              )
                        ],
                      ),
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: controller.imageList.isNotEmpty
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: controller.imageList.length,
                              itemBuilder: (context, index) {
                                return reportImage(
                                    context: context,
                                    img: controller.imageList[index],
                                    controller: controller);
                              })
                          : Center(
                              child: Text(
                                "尚未上傳圖片",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black),
                              ),
                            )),
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  //Text('請選擇回報類型'),
                  /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    onChanged: (ReportType value) => controller.reportType(value: value),
                    value: reportType.errorScreen,
                    groupValue: _report,
                  ),
                  Text('畫面異常'),
                  Radio(
                    onChanged: (reportType? value) {
                      setState(() {
                        _report = value;
                      });
                    },
                    value: reportType.errorAccount,
                    groupValue: _report,
                  ),
                  Text('帳號舉報'),
                  Radio(
                    onChanged: (reportType? value) {
                      setState(() {
                        _report = value;
                      });
                    },
                    value: reportType.others,
                    groupValue: _report,
                  ),
                  Text('其他'),
                ],
              ),*/
                  GestureDetector(
                    onTap: () => controller.getActionSheet(context: context),
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.pink.shade300,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2.0, 2.0), //陰影y軸偏移量
                              blurRadius: 3, //陰影模糊程度
                              spreadRadius: 0.5 //陰影擴散程度
                              )
                        ],
                      ),
                      child: Text(
                        '拍照或上傳',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 200.0,
                      child: DecoratedBox(
                        child: TextFormField(
                          controller: controller.textEditingController,
                          focusNode: controller.focusNode,
                          textAlign: TextAlign.center,
                          maxLines: null,
                          minLines: null,
                          autofocus: false,
                          expands: true,
                          style: new TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '請寫下問題',
                            hintStyle:
                                TextStyle(fontSize: 30, color: Colors.black),
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                                borderSide:
                                    (BorderSide(color: Colors.black, width: 2)),
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                          onChanged: (text) {
                            Provider.of<CustomServiceNotify>(context,
                                    listen: false)
                                .questionsValidating(
                                    fieldValue:
                                        controller.textEditingController.text);
                          },
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                            color: Colors.grey),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Consumer<CustomServiceNotify>(
                      builder: (context, questions, _) {
                    return Text(
                      '${questions.questionsErrorMsg}',
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    );
                  }),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  ElevatedButton(onPressed: () {}, child: Text(S().submit))
                ],
              ).paddingOnly(top: MediaQuery.of(context).size.height * 0.13)
            ],
          ),
        ),
      );
    });
  }

  Widget reportImage(
      {required BuildContext context,
      required String img,
      required CustomServiceNotify controller}) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              await popWidget.imageFileDialog(context: context, img: img);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                File(img),
                fit: BoxFit.cover,
                width: 100.0,
                height: 70.0,
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              child: ClipOval(
                child: Container(
                  width: 15.0,
                  height: 15.0,
                  color: Colors.lightBlue,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 12.0,
                  ),
                ),
              ),
              onTap: () => controller.removeImage(image: img),
            ),
          )
        ],
      ),
    );
  }
}
