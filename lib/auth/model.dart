// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Booking> bookingFromJson(String str) => List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  final String name;
  final String phone;
  final String address;
  final String stationName;
  final String price;
  final String time;
  final String date;
  final String admin;


  Booking({
    required this.name,
    required this.phone,
    required this.address,
    required this.stationName,
    required this.price,
    required this.time,
    required this.date,
    required this.admin,

  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    stationName: json["stationName"],
    price: json["price"],
    time: json["time"],
    date: json["date"],
    admin: json["admin"],

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
    "stationName": stationName,
    "price": price,
    "time": time,
    "date": date,
    "admin": admin,

  };
}
