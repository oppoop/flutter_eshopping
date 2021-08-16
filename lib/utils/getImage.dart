import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/regist_notifier.dart';
class GetImage {
  int _photoIndex = 0;
  List _actionSheet = [
    {"name": "拍照", "icon": Icon(Icons.camera_alt)},
    {"name": "相册", "icon": Icon(Icons.photo)},
    {"name": "man", "icon": Icon(Icons.image)},
    {"name": "woman", "icon": Icon(Icons.image)},
  ];

  Future<void> getActionSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _actionSheet.length,
              itemExtent: 50.0,
              itemBuilder: (innerCtx, i) {
                return ListTile(
                  title: Text(_actionSheet[i]["name"]),
                  leading: _actionSheet[i]["icon"],
                  onTap: () {
                    _photoIndex = i;
                    _getImage(context: context);
                  },
                );
              },
            ),
          );
        });
  }

  Future<void> _getImage({required BuildContext context}) async {
    Navigator.of(context).pop();
    ImagePicker picker = ImagePicker();
    var image = await picker.getImage(
        source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      Provider.of<RegistNotifier>(context,listen: false).headImgChange(headImgUrl: image.path,imgLocal: true);
      print('本地位址:${image.path}');
    }
  }
}
