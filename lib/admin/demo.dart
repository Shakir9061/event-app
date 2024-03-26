
import 'package:flutter/material.dart';

class TwoTabBar extends StatefulWidget {
  const TwoTabBar({Key? key}) : super(key: key);

  @override
  State<TwoTabBar> createState() => _TwoTabBarState();
}

class _TwoTabBarState extends State<TwoTabBar> with TickerProviderStateMixin {
  TabController? _tabController;
  TabController? _tabController2;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _tabController2 = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Widget'),
        bottom: TabBar(
          controller: _tabController2,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              tabs: [
                Tab(
                  icon: Icon(Icons.person),
                ),
                Tab(
                  icon: Icon(
                    Icons.add,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.deck,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.child_care,
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController2,
                children: const <Widget>[
                  Center(
                    child: Text("It's cloudy here"),
                  ),
                  Center(
                    child: Text("It's rainy here"),
                  ),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Text(
                      'Screen 1',
                    ),
       

       ),
              Center(
                child: Text(
                  'Screen 2',
                ),
              ),
              Center(
                child: Text(
                  'Screen 3',
                ),
              ),
              Center(
                child: Text(
                  'Screen 4',
                ),
              ),
            ],
            controller: _tabController,
          ),
        ),
      ],
    ),
  ),
);
  }
}