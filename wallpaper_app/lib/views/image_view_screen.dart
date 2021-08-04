import 'dart:typed_data';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';

class ImageViewScreen extends StatefulWidget {
  final String imageUrl;

  const ImageViewScreen({this.imageUrl});

  @override
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  // String _localPath;
  var filePath;
  // String BASE64_IMAGE;
  String _wallpaperAsset = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        // builder is used only for the snackbar, if you don't want the snackbar you can remove
        // Builder from the tree
        builder: (BuildContext context) => HawkFabMenu(
          icon: AnimatedIcons.menu_arrow,
          fabColor: Colors.black,
          iconColor: Colors.white,
          blur: 1,
          items: [
            HawkFabMenuItem(
              label: 'Set WallPaper',
              ontap: () {
                setState(() {
                  _settingModalBottomSheet(context);
                });

                // Scaffold.of(context)..hideCurrentSnackBar();
                // Scaffold.of(context).showSnackBar(
                //   SnackBar(content: Text('Set WallPaper successfully')),
                // );
              },
              icon: Icon(Icons.photo_outlined),
              color: Colors.black,
              labelColor: Colors.black,
            ),
            HawkFabMenuItem(
              label: 'Download',
              ontap: () {
                __onImageDownloadButton();
                Scaffold.of(context)..hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Image Saved Successfully')),
                );
              },
              icon: Icon(Icons.download_rounded),
              color: Colors.black,
              labelColor: Colors.black,
            ),
            HawkFabMenuItem(
              label: 'Share',
              ontap: () {
                // __onImageShareButton();
                // Scaffold.of(context)..hideCurrentSnackBar();
                // Scaffold.of(context).showSnackBar(
                //   SnackBar(content: Text('Shar')),
                // );
              },
              icon: Icon(Icons.share),
              color: Colors.black,
              labelColor: Colors.black,
            ),
          ],
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//download image
  void __onImageDownloadButton() {
    // EasyLoading.show(status: 'loading...');

    ImageDownloader.downloadImage(widget.imageUrl);

    // var response = await http.get(widget.imageUrl);
    // filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  }

  void setWallpaperForHome(String image) async {
    EasyLoading.show(status: 'loading...');
    try {
      EasyLoading.show(status: 'loading...');
      var file = await DefaultCacheManager().getSingleFile(image);
      int location = WallpaperManager.HOME_SCREEN;
      String result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      if (result != null) {
        print(result);
        EasyLoading.showToast('WallPaper Set Successfully...');
      }
    } catch (e) {}
  }

  void setWallpaperForLockScreen(String image) async {
    EasyLoading.show(status: 'loading...');
    try {
      EasyLoading.show(status: 'loading...');
      var file = await DefaultCacheManager().getSingleFile(image);
      int location = WallpaperManager.LOCK_SCREEN;

      String result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      EasyLoading.show(status: 'loading...');
      if (result != null) {
        print(result);
        EasyLoading.showToast('WallPaper Set Successfully...');
      }
    } catch (e) {}
  }

  void setWallpaperForBothScreen(String image) async {
    EasyLoading.show(status: 'loading...');
    try {
      EasyLoading.show(status: 'loading...');
      var file = await DefaultCacheManager().getSingleFile(image);
      int location = WallpaperManager.BOTH_SCREENS;

      String result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      EasyLoading.show(status: 'loading...');
      if (result != null) {
        print(result);
        EasyLoading.showToast('WallPaper Set Successfully...');
      }
    } catch (e) {}
  }
  //share Image
  // void __onImageShareButton() async {
  //   EasyLoading.show(status: 'loading...');
  //   var response = await http.get(widget.imageUrl);
  //   filePath = await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  //   BASE64_IMAGE = filePath;
  //   EasyLoading.dismiss();
  //   try {
  //     final ByteData bytes = await rootBundle.load(BASE64_IMAGE);
  //     await EsysFlutterShare.shareImage(
  //         'WallPaper.png', bytes, 'Amazing WallPaper App');
  //     // await Share.file(
  //     //     'esys image', 'esys.png', bytes.buffer.asUint8List(), 'png', text: 'My optional text.');
  //   } catch (e) {
  //     print('error: $e');
  //   }
  // }
  // _onTapProcess(BuildContext context) {
  //   return CupertinoAlertDialog(
  //     title: Text(('Set As Wallpaper')),
  //     content: Text('Click Yes to set Wallpaper'),
  //     // ignore: deprecated_member_use
  //     actions: [
  //       // ignore: deprecated_member_use
  //       FlatButton(
  //           onPressed: () {
  //             setState(() {
  //               //     setWallpaperFromAsset(path);
  //             });
  //           },
  //           child: Text('Yes')),
  //       // ignore: deprecated_member_use
  //       FlatButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: Text('No')),
  //     ],
  //   );
  // }
  // Future<void> _showMyDialog() async {
  //   return showDialog<void>(
  //   context: context,
  //   barrierDismissible: false, // user must tap button!
  //   builder: (BuildContext context) {
  //   return AlertDialog(
  //   title: Text('AlertDialog Title'),
  //   content: SingleChildScrollView(
  //   child: ListBody(
  //   children: <Widget>[
  //   Text('This is a demo alert dialog.'),
  //   Text('Would you like to approve of this message?'),
  //   ],
  //   ),
  //   ),
  //   actions: <Widget>[
  //   TextButton(
  //   child: Text('Approve'),
  //   onPressed: () {
  //   Navigator.of(context).pop();
  //   },
  //   ),
  //   ],
  //   );

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: new Wrap(
              runSpacing: -10,
              children: <Widget>[
                new ListTile(
                    minVerticalPadding: 0,
                    title: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: new Text(
                        'Set HomeScreen',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    onTap: () => {
                          setWallpaperForHome(widget.imageUrl),
                        }),
                Divider(
                  thickness: 1,
                  indent: 100,
                  endIndent: 100,
                  color: Colors.black26,
                ),
                new ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.zero,
                  title: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: new Text(
                      'Set LockScreen',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () => {setWallpaperForLockScreen(widget.imageUrl)},
                ),
                Divider(
                  thickness: 1,
                  indent: 100,
                  endIndent: 100,
                  color: Colors.black26,
                ),
                new ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: new Text(
                    'Set For Both',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  onTap: () => {setWallpaperForBothScreen(widget.imageUrl)},
                ),
              ],
            ),
          );
        });
  }
}
