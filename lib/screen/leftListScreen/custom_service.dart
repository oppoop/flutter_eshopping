import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
import 'package:flutter_eshopping/providers/custom_service_notifier.dart';
import 'package:flutter_eshopping/utils/dialog.dart';
import 'package:flutter_eshopping/utils/pop_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'history_report_list.dart';

class CustomerCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customCenter(context: context),
    );
  }

  Widget _customCenter({required BuildContext context}) {
    return Consumer<CustomServiceNotify>(builder: (context, controller, _) {
      return SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _topBar(context: context),
              Column(
                children: <Widget>[
                  Container(
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
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: controller.imageList.isNotEmpty
                          ? MediaQuery.removePadding(
                              removeTop: true,
                              context: context,
                              child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: controller.imageList.length,
                                  itemBuilder: (context, index) {
                                    return _reportImage(
                                        context: context,
                                        img: controller.imageList[index],
                                        controller: controller);
                                  })).paddingOnly(top: 25)
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "點擊上傳圖片",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey[500]),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error,
                                        color: Colors.grey[500],
                                        size: 18,
                                      ),
                                      Text(
                                        "最多上傳 4 張",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ],
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
                  customButton(
                      onPressed: () =>
                          controller.getActionSheet(context: context),
                      text: '拍照或上傳'),
                  Padding(padding: EdgeInsets.only(bottom: 30)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 200.0,
                    child: TextFormField(
                      controller: controller.textEditingController,
                      focusNode: controller.focusNode,
                      textAlign: TextAlign.center,
                      maxLines: null,
                      minLines: null,
                      autofocus: true,
                      expands: true,
                      style: new TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '請寫下問題',
                        hintStyle:
                            TextStyle(fontSize: 20, color: Colors.grey[500]),
                        border: InputBorder.none,
                      ),
                      onChanged: (text) {
                        Provider.of<CustomServiceNotify>(context, listen: false)
                            .questionsValidating(
                                fieldValue:
                                    controller.textEditingController.text);
                      },
                    ).paddingOnly(left: 10, right: 10, bottom: 20),
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
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    '${controller.questionsErrorMsg}',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  customButton(
                      onPressed: () {
                        ShowDialog.dialogLoading(context);
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.pop(context);
                        }).whenComplete(() {
                          ShowDialog.dialogSuccess(context);
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });
                        }).whenComplete(() => controller.sendReport(context));
                      },
                      text: S().submit),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ).paddingOnly(top: MediaQuery.of(context).size.height * 0.13)
            ],
          ),
        ),
      );
    });
  }

  Widget _topBar({required BuildContext context}) {
    return Container(
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
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              )),
          Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              '問題回報',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HistoryReportList(),
                ),
              ),
              icon: Icon(
                Icons.history,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ).paddingOnly(top: 30),
    );
  }

  Widget _reportImage(
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
                width: 140.0,
                height: 100.0,
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

  Widget customButton(
      {double height = 40,
      double width = 100,
      required Function onPressed,
      required String text}) {
    return GestureDetector(
      onTap: onPressed as void Function(),
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
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
