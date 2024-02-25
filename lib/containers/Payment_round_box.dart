import 'dart:ffi';

import 'package:flutter/material.dart';

class PaymentRoundBox extends StatelessWidget {
  const PaymentRoundBox({
    super.key,
    required this.title,
    required this.cost,
    required this.borderColor,
    required this.bgColor,
    required this.buttonColor,
    this.leadicon = false,
  });

  final String title;
  final String cost;
  final Color borderColor, bgColor, buttonColor;
  final bool leadicon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: bgColor,
        border: Border.all(
          color: borderColor, // Set the color of the outline
          width: 2.0, // Set the width of the outline
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leadicon
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green),
                        child: const Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.transparent.withOpacity(0.1)),
                      ),
                const SizedBox(
                  width: 5,
                ),
                Text(title,overflow: TextOverflow.ellipsis,)
              ],
            ),
            Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: buttonColor),
              child: Center(
                  child: Text(
                cost,
                style: TextStyle(color: Colors.white),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
