import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/contants.dart';
import 'package:amazon_clone/widget/account_screen_app_bar.dart';
import 'package:amazon_clone/widget/custom_primary_button.dart';
import 'package:amazon_clone/widget/products_showcase_list_view.dart';
import 'package:amazon_clone/widget/simple_product_widget.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.screenHeight,
            width: context.screenWidth,
            child: Column(
              children: [
                const IntroductionWidgetAccountScreen(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                    color: orangeColor,
                    isLoading: true,
                    onPressed: () {},
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: blackColor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                    color: yellowColor,
                    isLoading: true,
                    onPressed: () {},
                    child: const Text("Sell", style: TextStyle(color: blackColor)),
                  ),
                ),
                ProductsShowcaseListView(title: "Your Orders", children: createChildren()),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Requests",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: const Text(
                        "Order: Black Shoe",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: const Text("Somewhere on earth"),
                      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
                    );
                  },
                  itemCount: 5,
                ))
              ],
            ),
          ),
        ));
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.000000000001)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello ",
                      style: TextStyle(color: Colors.grey[800], fontSize: 27),
                    ),
                    TextSpan(
                      text: "Demet",
                      style: TextStyle(color: Colors.grey[800], fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(categoryLogos[1]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
