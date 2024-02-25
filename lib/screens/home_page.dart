import 'package:flutter/material.dart';
import 'package:shoshin_tech_assignment/containers/custom_tab_bar.dart';

import 'package:shoshin_tech_assignment/containers/primary_header_container.dart';

import 'all_offers_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.menu,color: Colors.white,),
            title: const Text("hey Shubham",style: TextStyle(color: Colors.white),),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.grey.withOpacity(0.5), // Set shadow color
                          spreadRadius: 2, // Set the spread radius
                          blurRadius: 4, // Set the blur radius
                          offset: const Offset(0, 2), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: const Center(child: Text("\u20B9456"))),
              )
            ],
            flexibleSpace: const BPrimaryHeaderContainer(),
            bottom: const PreferredSize(
              preferredSize:
                  Size.fromHeight(20.0), // Adjust the height as needed
              child: SizedBox(), // Empty SizedBox to create space
            ),
          ),
          body: Column(
            children: [
              const BTabBar(tabs: [
                Tab(child: Text('All Offers')),
                Tab(child: Text('Gifts')),
                Tab(child: Text("Upcoming")),
                Tab(child: Text('My Offers')),
              ]),
              Expanded(
                child: TabBarView(children: [
                  AllOffersTab(),
                  Container(
                    color: Colors.orange,
                  ),
                  Container(
                    color: Colors.pink,
                  ),
                  Container(
                    color: Colors.blueGrey,
                  ),
                ]),
              )
            ],
          )),
    );
  }
}


