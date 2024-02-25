import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoshin_tech_assignment/models/details.dart';
import 'package:shoshin_tech_assignment/models/task.dart';
import 'package:shoshin_tech_assignment/screens/home_page.dart';
import '../containers/Payment_round_box.dart';
import '../containers/primary_header_container.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
    required this.item, required this.event,
  });
  final Task item;
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAll(const HomeScreen());
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white,)),
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
                      color: Colors.grey.withOpacity(0.5), // Set shadow color
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
          preferredSize: Size.fromHeight(20.0), // Adjust the height as needed
          child: SizedBox(), // Empty SizedBox to create space
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(item.thumbnail))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(item.shortDesc,maxLines: 4,),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedRatingStars(
                          readOnly: true,
                          starSize: 15,
                          onChanged: (_) {},
                          customFilledIcon: Icons.star,
                          customHalfFilledIcon: Icons.star_half,
                          customEmptyIcon: Icons.star_border_outlined,
                          initialRating:
                              double.tryParse(item.customData.appRating) ?? 0,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("steps(1/4)"),
              const SizedBox(
                height: 20,
              ),
              PaymentRoundBox(
                cost: event.payout,
                title: event.description,
                borderColor: Colors.green,
                bgColor: Colors.transparent,
                buttonColor: Colors.green,
                leadicon: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.orange, // Set the color of the outline
                    width: 2.0, // Set the width of the outline
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.orange),
                                child: const Icon(
                                  Icons.arrow_right_alt_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("Complete 3 offers")
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange),
                            child:  Center(
                                child: Text(
                              item.payout,
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eleifend turpis id odio luctus, nec convallis velit sagittis. Vivamus accumsan dui sed arcu condimentum, id dictum metus tincidunt. Aliquam erat volutpat. Integer hendrerit massa quis lacus convallis,",
                            maxLines: 2,

                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentRoundBox(
                cost: item.payout,
                title: 'Refer workstation to friend',
                borderColor: Colors.transparent,
                bgColor: Colors.grey.withOpacity(0.4),
                buttonColor: Colors.black12,
              ),
              const SizedBox(
                height: 20,
              ),
              PaymentRoundBox(
                cost: '₹20',
                title: 'withdraw first amount',
                borderColor: Colors.transparent,
                bgColor: Colors.grey.withOpacity(0.4),
                buttonColor: Colors.black12,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                ' ₹23.456 users has already participated',
                style: TextStyle(color: Colors.orange),
              )),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Get ₹364',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Set button color
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity,
                        50), // Set button width to screen width and height to 50
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
