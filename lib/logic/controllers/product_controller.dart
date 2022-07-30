//import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/services/product_repository.dart';
import 'package:e_commerce/services/product_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../model/product_json_models.dart';

class ProductController extends GetxController {
  RxList productList = <ProductModels>[].obs;
  RxList favouritesList = <ProductModels>[].obs;
  RxBool isLoading = true.obs;
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? storageShopping = storage.read<List>('isFavouritesList');

    if (storageShopping != null) {
      favouritesList =
          storageShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getAllProductsList();
  }

  void getAllProductsList() async {
    ProductRepository(ProductServices())
        .getAllProductsList()
        .then((productsObj) {
      isLoading.value = false;
      productList.addAll(productsObj);
    }).catchError((onError) {
      isLoading.value = false;
      print(" There was Error in 'product_controller' ==>  $onError ");
    });
  }

  void manageProducts(int productId) async {
    int existingIndex = favouritesList.indexWhere((element) {
      return element.id == productId;
    });
    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);
      await storage.remove('isFavouritesList');
    } else {
      favouritesList.add(productList.firstWhere((element) {
        return element.id == productId;
      }));
      await storage.write('isFavouritesList', favouritesList);
    }
  }

  // Logic for Favourites Screen
  bool isFavourites(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }
}

/*

class ProductController extends GetxController {
  RxList productList = <ProductModels>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProductsData();
    print('The Data of productList is ==> $productList');
  }

  void getProductsData() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading.value = false;
      if (products.isNotEmpty) {
        productList.addAll(products);
        print('The Data of 2 productList is ==> $productList');
      }
    } finally {
      isLoading.value = false;
      print(" ===> finally ");
    }
  }

 */
