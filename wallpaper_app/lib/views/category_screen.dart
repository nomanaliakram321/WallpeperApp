import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/model/wallpeper_model.dart';
import 'package:wallpaper_app/widgets/widget.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;

  const CategoryScreen({this.categoryName, searchWallpaper});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperModel> wallpapers = new List();

  SearchTrendingWallpeper(String searchwallpaper) async {
    var url =
        'https://api.pexels.com/v1/search?query=$searchwallpaper&per_page=20';
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
    SearchTrendingWallpeper(widget.categoryName);
    searchController.text = widget.categoryName;
    super.initState();
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
      body: SingleChildScrollView(
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
                                  builder: (context) => CategoryScreen(
                                        categoryName: searchController.text,
                                      )));
                        },
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 70,
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: categories.length,
              //       itemBuilder: (context, index) {
              //         return CategoriesListView(
              //           name: categories[index].categoriesName,
              //           imageUrl: categories[index].imageUrl,
              //         );
              //       }),
              // ),
              SizedBox(
                height: 10,
              ),
              WallpaperList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    ));
  }
}
