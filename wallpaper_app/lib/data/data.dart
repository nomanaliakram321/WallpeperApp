import 'package:wallpaper_app/model/categories_model.dart';
String apiKey="563492ad6f9170000100000154cb8b851623473186f6785d4501290d";
List <CategoriesModel> getCategories(){
  List<CategoriesModel> categories=new List();
  CategoriesModel categorieModel=new CategoriesModel();

  //

  categorieModel.imageUrl='https://images.pexels.com/photos/1707640/pexels-photo-1707640.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categorieModel.categoriesName='Street Art';
  categories.add(categorieModel);
  categorieModel =new CategoriesModel();
  //
  categorieModel.imageUrl='https://images.pexels.com/photos/162256/wolf-predator-european-wolf-carnivores-162256.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categorieModel.categoriesName='Wild Life';
  categories.add(categorieModel);
  categorieModel =new CategoriesModel();
  //
  categorieModel.imageUrl='https://images.pexels.com/photos/1785493/pexels-photo-1785493.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categorieModel.categoriesName='Nature';
  categories.add(categorieModel);
  categorieModel =new CategoriesModel();
  //
  categorieModel.imageUrl='https://images.pexels.com/photos/2045600/pexels-photo-2045600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categorieModel.categoriesName='Motivation';
  categories.add(categorieModel);
  categorieModel =new CategoriesModel();
  //
  categorieModel.imageUrl='https://images.pexels.com/photos/374870/pexels-photo-374870.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categorieModel.categoriesName='City';
  categories.add(categorieModel);
  categorieModel =new CategoriesModel();
  //
  categorieModel.imageUrl='https://images.pexels.com/photos/4141962/pexels-photo-4141962.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categorieModel.categoriesName='Cars';
  categories.add(categorieModel);
  categorieModel =new CategoriesModel();
  //
  categorieModel.imageUrl='https://images.pexels.com/photos/2611675/pexels-photo-2611675.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  categorieModel.categoriesName='Bikes';
  categories.add(categorieModel);
  categorieModel =new CategoriesModel();
  return categories;

}