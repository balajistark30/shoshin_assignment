import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:shoshin_tech_assignment/models/details.dart';
import 'package:shoshin_tech_assignment/screens/payment_screen.dart';

import '../models/task.dart';

class AllOffersTab extends StatefulWidget {
  const AllOffersTab({
    Key? key,
  }) : super(key: key);

  @override
  State<AllOffersTab> createState() => _AllOffersTabState();
}

class _AllOffersTabState extends State<AllOffersTab> {
  List<Task> _items = [];
  List<Event> _events = [];


  @override
  void initState() {
    super.initState();
    readJson();
    readDetailsJson();
  }

  Future<void> readJson() async {
    try {
      final String response =
      await rootBundle.loadString('assets/dummy_tasks.json');
      final data = jsonDecode(response);
      List<Task> tasks = [];
      for (var taskJson in data) {
        tasks.add(Task.fromJson(taskJson));
      }
      setState(() {
        _items= tasks;
      });
    } catch (e) {
    }
  }
  Future<void> readDetailsJson() async {
    try {
      final String response =
      await rootBundle.loadString('assets/dummy_details.json');
      final data = jsonDecode(response);
      List<Event> tasks = [];
      for (var taskJson in data) {
        tasks.add(Event.fromJson(taskJson));
      }
      setState(() {
        _events= tasks;
      });
    } catch (e) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.local_fire_department,color: Colors.orange,),
              SizedBox(
                width: 10,
              ),
              Text("Trending Offers"),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: CarouselSlider.builder(
              itemCount: _items.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(_items[index].thumbnail),
                        fit: BoxFit.cover, // Ensure the image covers the whole container
                      ),
                    ),
                    child:Column(
                      children: [
                        const Expanded(child: SizedBox()),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8),bottomLeft: Radius.circular(8.0)),),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _items[index].brand.title,
                                  style: const TextStyle(color: Colors.white), // Adjust text color as needed
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Get Rs.${_items[index].earned}", style: const TextStyle(color: Colors.white), // Adjust text color as needed
                                ),
                                Text(
                                  "${_items[index].totalLead} Users",
                                  style: const TextStyle(color: Colors.white), // Adjust text color as needed
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ) ,
                  ),
                );
              },
              options: CarouselOptions(

                aspectRatio: 16 / 9,
                viewportFraction: 0.5,
                initialPage: 0,

                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  // Do something with index and reason
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Icon(Icons.local_fire_department,color: Colors.orange,),
              SizedBox(
                width: 10,
              ),
              Text("More Offers"),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (_, index) {
                if (_items.isEmpty || index >= _items.length) {

                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Card(
                    key: ValueKey(_items[index].taskId),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => PaymentScreen(
                          item: _items[index], event: _events[index],
                        ));
                      },
                      leading: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: NetworkImage(_items[index].thumbnail),
                          ),
                        ),
                      ),
                      title: Text(_items[index].brand.title,style: const TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(_items[index].shortDesc,overflow: TextOverflow.ellipsis,),
                      trailing: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.flash_on, color: Colors.orange), // Flash icon
                          const SizedBox(width: 4), // Spacer between icon and text
                          Text(_items[index].earned,style: const TextStyle(fontSize: 14),),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Color(int.tryParse("0xFF${_items[index].customData.dominantColor}") ?? 0),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

          ),
        ],
      ),
    );
  }
}
