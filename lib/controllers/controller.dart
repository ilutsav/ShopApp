import 'package:get/state_manager.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/services/remote_services.dart';

class ProductController extends GetxController {
  var productList = <Post>[].obs;

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    var products = await RemoteServices.fetchProducts();
    productList.value = products!;
  }
}
