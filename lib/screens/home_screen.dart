import 'package:amazon_clone/utils/contants.dart';
import 'package:amazon_clone/widget/banner_ad_widget.dart';
import 'package:amazon_clone/widget/categories_horizontal_list_view_bar.dart';
import 'package:amazon_clone/widget/products_showcase_list_view.dart';
import 'package:amazon_clone/widget/search_bar_widget.dart';
import 'package:amazon_clone/widget/simple_product_widget.dart';
import 'package:amazon_clone/widget/user_details_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  double offset = 0;
  List<Widget> createChildren() {
    List<Widget> children = [];
    for (var i = 0; i <= 10; i++) {
      children.add(
        const SimpleProductWidget(
          url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
        ),
      );
      children.add(
        const SimpleProductWidget(
          url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
        ),
      );
    }
    return children;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        offset = scrollController.position.pixels;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SizedBox(
                  height: kAppBarHeight / 2,
                ),
                const CategoriesHorizontalListViewBar(),
                const BannerAdWidget(),
                ProductsShowcaseListView(
                  title: "Upto 70%",
                  children: createChildren(),
                ),
                ProductsShowcaseListView(
                  title: "Upto 60%",
                  children: createChildren(),
                ),
                ProductsShowcaseListView(
                  title: "Upto 50%",
                  children: createChildren(),
                ),
                ProductsShowcaseListView(
                  title: "Explore",
                  children: createChildren(),
                )
              ],
            ),
          ),
          Positioned(top: -offset / 5, child: UserDetailsBar(offset: offset))
        ],
      ),
    );
  }
}
