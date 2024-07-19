import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_sizes.dart';
import '../../../widgets/x_loading_overlay.dart';
import '../controllers/home_controller.dart';
import '../widgets/Custom_AppBar.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_searchBar.dart';
import '../widgets/custome_category_button.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController searchController = TextEditingController();
//     return Scaffold(
//
//       appBar: const CustomAppbar(),
//       body: XLoadingOverlay(
//         loading: controller.loading,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
//           child: Column(
//             children: [
//               CustomSearchbar(controller: searchController),
//               SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomCategoryButton(
//                       title: 'Electronics',
//                       onPressed: () {},
//                     ),
//                     gapW12,
//                     CustomCategoryButton(
//                       title: 'Jewelry',
//                       onPressed: () {},
//                     ),
//                     gapW12,
//                     CustomCategoryButton(
//                       title: 'Men\'s',
//                       onPressed: () {},
//                     ),
//                     gapW12,
//                     CustomCategoryButton(
//                       title: 'Women\'s',
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               gapH20,
//               Expanded(
//                 child: CustomScrollView(
//                   slivers: [
//                     SliverGrid.count(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 4.0,
//                       childAspectRatio: 0.8,
//                       children: [
//                         ProductCard(
//                           onPressed: () {},
//                           title: 'John Hardy Women',
//                           imageUrl: 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
//                           price: 695.0,
//                         ),
//                         ProductCard(
//                           onPressed: () {},
//                           title: 'John Hardy Women',
//                           imageUrl: 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
//                           price: 695.0,
//                         ),
//                         ProductCard(
//                           onPressed: () {},
//                           title: 'John Hardy Women',
//                           imageUrl: 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
//                           price: 695.0,
//                         ),
//                         ProductCard(
//                           onPressed: () {},
//                           title: 'John Hardy Women',
//                           imageUrl: 'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
//                           price: 695.0,
//                         ),
//                         // Add more items as needed
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => controller.getTransactionList());

    return Scaffold(
      appBar: const CustomAppbar(),
      body: XLoadingOverlay(
        loading: controller.loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Obx(() {
            if (controller.store.allTransactionList.isEmpty) {
              return const Center(child: Text('No posts available.'));
            }
            return CustomScrollView(
              slivers: [
                SliverGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  childAspectRatio: 0.8,
                  children: controller.store.allTransactionList.map((post) {
                    return ProductCard(
                      onPressed: () {},
                      title: post!.title,
                      price: post!.body,
                    );
                  }).toList(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}



