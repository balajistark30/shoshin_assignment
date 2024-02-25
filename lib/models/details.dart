import 'dart:convert';

class Event {
  final String eventId;
  final String title;
  final String description;
  final String payout;
  final bool isCompleted;
  final int payoutAmt;
  final String payoutCurrency;

  Event({
    required this.eventId,
    required this.title,
    required this.description,
    required this.payout,
    required this.isCompleted,
    required this.payoutAmt,
    required this.payoutCurrency,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['eventId'],
      title: json['title'],
      description: json['description'],
      payout: json['payout'],
      isCompleted: json['isCompleted'],
      payoutAmt: json['payout_amt'],
      payoutCurrency: json['payout_currency'],
    );
  }
}
