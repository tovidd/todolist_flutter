import 'package:rxdart/rxdart.dart';

import '../../model/change_password/change_password_model.dart';
import '../../resource/repository.dart';

class ChangePasswordBloc {
  Repository _repository= Repository();
  ChangePasswordModel changePasswordModel= ChangePasswordModel();

  final _listProduct = BehaviorSubject<List<Map<dynamic, dynamic>>>();
  

  Stream<List<Map<dynamic, dynamic>>> get products => _listProduct.stream;

  Function(List<Map<dynamic, dynamic>>) get addProducts => _listProduct.sink.add;

  getProduct() async {
    addProducts(null);
    List<Map<dynamic, dynamic>> list_product;
    List<String> month= changePasswordModel.getMonth;
    list_product = new List();
      for (var k = 0; k < month.length; k++) {
        Map map = Map();
        map.putIfAbsent(month[k], () => changePasswordModel.getWeeks());
        list_product.add(map);
      }
      list_product.map((s) {}).map((list) => list).toList();
      addProducts(list_product);
  }

  
  // final _product_terlaris = BehaviorSubject<ProductResponseModel>();

  // Stream<ProductResponseModel> get productTerlaris => _product_terlaris.stream;

  // Function(ProductResponseModel) get addProductTerlaris => _product_terlaris.sink.add;

  // getProductTerlaris() async {
  //   addProductTerlaris(null);
  //   final response = await _repository.getProductTerlaris();
  //   print(response.toJson());
  //   addProductTerlaris(response); 
  // }

  // getProductType() async{
  //   List<Map<dynamic, dynamic>> list_product;
    
  //   list_product = new List();
  //     for (var k = 0; k < await _product_terlaris.length; k++) {
  //       Map map = Map();
  //       map.putIfAbsent(productTerlaris[k], () => changePasswordModel.getWeeks());
  //       list_product.add(map);
  //     }
      
  //     addProductTerlaris(list_product);
  // }

  dispose() {
    _listProduct.close();
  }
}
