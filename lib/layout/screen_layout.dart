import 'package:amazon_clone/screens/account_screen.dart';
import 'package:amazon_clone/screens/home_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: const [
            Center(
              child: HomeScreen(),
            ),
            Center(
              child: AccountScreen(),
            ),
            Center(
              child: Text("Cart Screen"),
            ),
            Center(
              child: Text("More Screen"),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration:
              const BoxDecoration(border: Border(top: BorderSide(color: Color.fromARGB(255, 189, 189, 189), width: 1))),
          child: TabBar(
            indicator: const BoxDecoration(
              border: Border(
                top: BorderSide(color: activeCyanColor, width: 4),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (int page) {
              changePage(page);
            },
            tabs: [
              Tab(
                child: Icon(Icons.home_outlined, color: currentPage == 0 ? activeCyanColor : blackColor),
              ),
              Tab(
                child: Icon(Icons.account_circle_outlined, color: currentPage == 1 ? activeCyanColor : blackColor),
              ),
              Tab(
                child: Icon(Icons.shopping_cart, color: currentPage == 2 ? activeCyanColor : blackColor),
              ),
              Tab(
                child: Icon(Icons.menu, color: currentPage == 3 ? activeCyanColor : blackColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
