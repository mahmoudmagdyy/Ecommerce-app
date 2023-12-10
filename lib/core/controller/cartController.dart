import 'package:appwithfirebase/core/service/database/cartDataBase.dart';
import 'package:appwithfirebase/model/cartProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController {
  ValueNotifier<bool> get loading => _loading();

  ValueNotifier<bool> _loading() => ValueNotifier(false);
  List<CartProductModel> _cardProductModel = [];

  List<CartProductModel> get cardProductModel => _cardProductModel;

  double get totalprice => _totalprice;
  double _totalprice = 0.0;

  var dpHelper = CartDtatBase();
  CartViewController() {
    getAllProduct();

  }

  getAllProduct() async {
    _loading().value = true;
    _cardProductModel = await dpHelper.getAllProduct();
    print(_cardProductModel.length);
    getTotalPrice();
    _loading().value = false;
    update();
  }
  getTotalPrice() {
    for (int i = 0; i < _cardProductModel.length; i++) {
      _totalprice += (double.parse(_cardProductModel[i].price.toString()) *
          (_cardProductModel[i].quantity));
      print(_totalprice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {

      for (int i = 0; i < _cardProductModel.length; i++) {
        if (_cardProductModel[i].productId == cartProductModel.productId) {
          return;
        }
      }
      var dpHelper = CartDtatBase();
      await dpHelper.insert(cartProductModel);
      _cardProductModel.add(cartProductModel);
      _totalprice += (double.parse(cartProductModel.price.toString()) *
          (cartProductModel.quantity));


    update();
  }



  increaseQuantity(int index)async{
    _cardProductModel[index].quantity++;
    _totalprice += (double.parse(_cardProductModel[index].price.toString()));
    await dpHelper.updateProduct(_cardProductModel[index]);
    update();
  }

  decreaseQuantity(int index)async{
    if(_cardProductModel[index].quantity>0){
      _cardProductModel[index].quantity--;
      _totalprice -= (double.parse(_cardProductModel[index].price.toString()));
     await dpHelper.updateProduct(_cardProductModel[index]);
    }else{
      return ;
    }
    update();
  }









}
