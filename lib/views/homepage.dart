import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopapp/controllers/controller.dart';
import 'package:shopapp/views/product_tile.dart';

class HomePage extends StatefulWidget {
  final ProductController productController = Get.put(ProductController());
  //HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "Shop",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.view_list_outlined),
                    onPressed: () {}),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: ProductController().productList.length,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(ProductController().productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1))),
            ),
          )
        ],
      ),
    );
  }
}
