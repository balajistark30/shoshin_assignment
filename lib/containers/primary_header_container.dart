import 'package:flutter/material.dart';

import '../curved_edges/curve_edges_widget.dart';

class BPrimaryHeaderContainer extends StatelessWidget {
  const BPrimaryHeaderContainer({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BCurvedEdgeWidget(
      child:Container(
        // height: height * 0.3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blue.shade600, // Starting color (darkest shade)
              Colors.blue.shade400, // Intermediate shade
              Colors.blue.shade300, // Lightest shade
            ],
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           IconButton(
        //               onPressed: () {}, icon: const Icon(Icons.menu)),
        //           const Text(
        //             'Hey Shubham',
        //             style: TextStyle(fontSize: 20, color: Colors.white),
        //           ),
        //         ],
        //       ),
        //       Container(
        //         height: 50,
        //         width: 100,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(30),
        //         ),
        //         child: Row(
        //           children: [
        //             Container(
        //               height: 30,
        //               width: 30,
        //               margin: EdgeInsets.only(left: 10),
        //               decoration: BoxDecoration(
        //                   color: Colors.lightBlueAccent,
        //                   borderRadius: BorderRadius.circular(20)),
        //             ),
        //             SizedBox(
        //               width: 10,
        //             ),
        //             Text(
        //               '₹ 452',
        //             )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}