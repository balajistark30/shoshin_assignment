import 'package:flutter/material.dart';

class BTabBar extends StatelessWidget implements PreferredSizeWidget{
  const BTabBar({
    super.key, required this.tabs,
  });
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      physics: ClampingScrollPhysics(),
      isScrollable: true,
      indicatorColor: Colors.blue,
      unselectedLabelColor: Color(0xFFA9A9A9),
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: tabs,

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);

}