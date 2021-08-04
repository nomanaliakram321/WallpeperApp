import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/categories_model.dart';
import 'package:wallpaper_app/model/wallpeper_model.dart';
import 'package:wallpaper_app/views/category_screen.dart';
import 'package:wallpaper_app/views/image_view_screen.dart';
import 'package:wallpaper_app/views/search_screen.dart';
import 'package:wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: deprecated_member_use
  List<CategoriesModel> categories = new List();
  // ignore: deprecated_member_use
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = TextEditingController();
  getTrendingWallpeper() async {
    var url = 'https://api.pexels.com/v1/curated?per_page=25';
    var response = await http.get(url, headers: {"Authorization": apiKey});
    print(response.body.toString());
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getTrendingWallpeper();
    categories = getCategories();
    refresh();
    super.initState();
  }
  Widget refresh()
  {
    return RefreshIndicator(

        child:SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        fillColor: Color(0xfff5f8fd),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Search',
                        suffixIcon: IconButton(
                          autofocus: false,
                          splashColor: Colors.white,
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen(
                                      searchWallpaper:
                                      searchController.text,
                                    )));
                          },
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoriesListView(
                          name: categories[index].categoriesName,
                          imageUrl: categories[index].imageUrl,
                        );
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: WallpaperList(wallpapers: wallpapers, context: context),
                    ),




                  ],
                )

              ],
            ),
          ),
        ) ,
        onRefresh:(){
          Navigator.pushReplacement(context,
              PageRouteBuilder(pageBuilder: (a,b,c)=>HomeScreen(),
          transitionDuration: Duration(seconds: 0))
          )  ;

return Future.value(false);

  });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: BrandName(),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: RefreshIndicator(
            onRefresh:(){
              Navigator.pushReplacement(context,
                  PageRouteBuilder(pageBuilder: (a,b,c)=>HomeScreen(),
                      transitionDuration: Duration(seconds: 0))
              )  ;

              return Future.value(false);

            },
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: searchController,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          filled: true,
                          fillColor: Color(0xfff5f8fd),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 0.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintText: 'Search',
                          suffixIcon: IconButton(
                            autofocus: false,
                            splashColor: Colors.white,
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                            searchWallpaper:
                                                searchController.text,
                                          )));
                            },
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoriesListView(
                            name: categories[index].categoriesName,
                            imageUrl: categories[index].imageUrl,
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: WallpaperList(wallpapers: wallpapers, context: context),
                      ),




                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  final String imageUrl, name;

  const CategoriesListView({@required this.imageUrl, @required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryScreen(
                      categoryName: name.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 100,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              width: 100,
              height: 55,
              child: Center(
                  child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 16),
              )),
            )
          ],
        ),
      ),
    );
  }
}



