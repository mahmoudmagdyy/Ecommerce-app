
import 'package:appwithfirebase/model/categoryModel.dart';
import 'package:appwithfirebase/model/productModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../service/home_services.dart';

class HomePageController extends GetxController{
  List<CategoryModel>? get categoryModele=>_categoryModele;
  List< CategoryModel>? _categoryModele =[] ;

  List<ProductModel>? get productModele=>_productModele;
  List< ProductModel>? _productModele =[] ;

  ValueNotifier<bool> get loading =>_loading;
  ValueNotifier<bool> _loading =ValueNotifier(false);


final CollectionReference _categoryCollectionReferance =
    FirebaseFirestore.instance.collection('Categories');


  final CollectionReference _productCollectionReferance =
  FirebaseFirestore.instance.collection('Products');

HomePageController(){
  getCategory();
  getBestSellingProducts();
}


  getCategory() async {
 _loading.value=true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModele!.add(CategoryModel.fromJson(value[i].data()as Map<String, dynamic>));
        _loading.value=false;

      }
      update();
    });
  }

  getBestSellingProducts() async{
    _loading.value=true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModele!.add(ProductModel.fromJson(value[i].data()as Map<String, dynamic>));
        _loading.value=false;

      }
      print(_productModele!.length);
      update();
    });
  }







}