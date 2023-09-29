import 'package:get/state_manager.dart';
import 'package:shopapp/models/product.dart';
import 'package:shopapp/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Post>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();

      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
