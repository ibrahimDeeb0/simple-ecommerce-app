//import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/services/product_services.dart';

import '../model/product_json_models.dart';

class ProductRepository {
  ProductServices productServices;

  ProductRepository(this.productServices);

  Future<List<ProductModels>> getAllProductsList() async {
    final products = await productServices.getAllProduct();

    return products
        .map((productsObj) => ProductModels.fromJson(productsObj))
        .toList();
  }
}
