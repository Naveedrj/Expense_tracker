import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
enum Catagory  {food , work , family , travel , vacations}

const CatagoryIcons = {
  Catagory.food: Icons.lunch_dining,
  Catagory.travel : Icons.flight_takeoff,
  Catagory.work : Icons.work,
  Catagory.family: Icons.family_restroom,
  Catagory.vacations : Icons.place_outlined
};

class Expense{




  Expense({
    required this.dateTime,
    required this.catagory,
    required this.amount,
    required this.title,
}):id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Catagory catagory;

}