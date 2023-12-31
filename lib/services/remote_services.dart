import 'package:http/http.dart' as http;
import 'package:shopapp/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Post>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
