import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_eshopping/providers/regist_notifier.dart';
import 'package:flutter_eshopping/generated/l10n.dart';
class GetImage {
  int _photoIndex = 0;
  List _actionSheet = [
    {"name": S().camera, "icon": Icon(Icons.camera_alt)},
    {"name": S().album, "icon": Icon(Icons.photo)},
    {"name": S().manHead, "icon": Icon(Icons.accessibility)},
    {"name": S().womanHead, "icon": Icon(Icons.pregnant_woman)},
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
    var image;
    Navigator.of(context).pop();
    ImagePicker picker = ImagePicker();
    if(_photoIndex == 0){image = await picker.getImage(source: ImageSource.camera);}
    if (_photoIndex == 1){image = await picker.getImage(source: ImageSource.gallery);}
    if (_photoIndex == 2){Provider.of<RegistNotifier>(
        context,
        listen: false)
        .headImgChange(
      headImgUrl:
      'assets/member_head/man.jpg',
      imgLocal:false,
    );}
    if (_photoIndex == 3){Provider.of<RegistNotifier>(context,
        listen: false)
        .headImgChange(
      headImgUrl:
      'assets/member_head/woman.jpg',
      imgLocal:false,
    );}
    /*var image = await picker.getImage(
        source: _photoIndex == 0 ? ImageSource.camera : ImageSource.gallery);*/
    if (image != null) {
      Provider.of<RegistNotifier>(context,listen: false).headImgChange(headImgUrl: image.path,imgLocal: true);
      print('本地位址:${image.path}');
    }
  }
}
