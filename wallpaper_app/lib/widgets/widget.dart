import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:wallpaper_app/model/wallpeper_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_app/views/image_view_screen.dart';

Widget BrandName() {
  return RichText(
    text: TextSpan(
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        children: <TextSpan>[
          TextSpan(
            text: 'Wallpaper',
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: 'Hub',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
        ]),
  );
}
Widget ConnectivityStatus()
{
  return Builder(
    builder: (BuildContext context) {
      return OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected =
              connectivity != ConnectivityResult.none;
          return Stack(

            children: [
              child,
              Positioned(
                left: 0.0,
                right: 0.0,
                height: 32.0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color:
                  connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                  child: connected
                      ?  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "OFFLINE",
                        style: TextStyle(color: Colors.white),
                      ),

                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "OFFLINE",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      SizedBox(
                        width: 12.0,
                        height: 12.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(
                              Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },

      );
    },
  );
}

Widget WallpaperList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),

    child: StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: wallpapers.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageViewScreen(
                            imageUrl: wallpapers[index].src.portrait,
                          )));
            },
            child: Hero(
              tag: wallpapers[index].src.portrait,
              child: new Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  child: Image.network(
                    wallpapers[index].src.portrait,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ));
      },
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
    ),

    //     child: StaggeredGridView.count(
    //       shrinkWrap: true,
    //     crossAxisCount: 2,
    //   // childAspectRatio: 0.6,
    //
    //   physics: ClampingScrollPhysics(),
    //   scrollDirection: Axis.vertical,
    //       mainAxisSpacing: 6.0,
    //       crossAxisSpacing: 6.0,
    //       children:wallpapers.map((wallpapers) {
    //         return GridTile(
    //           child: Container(
    //             child: Image.network(wallpapers.src.portrait),
    //           ),
    //
    //         );
    //       }).toList()
    // )
    //
  );
}
