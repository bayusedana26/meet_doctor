// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DoctorModel {
  String name;
  String image;
  Color imageBox;
  List<String> specialities;
  List<CalendarModel> calendar;
  List<TimeModel> time;
  double score;
  String bio;

  DoctorModel({
    required this.name,
    required this.image,
    required this.imageBox,
    required this.specialities,
    required this.score,
    required this.bio,
    required this.calendar,
    required this.time,
  });

  static List<DoctorModel> getDoctors() {
    List<DoctorModel> doctors = [];

    doctors.add(
      DoctorModel(
        name: 'Dr. John Doe',
        image: 'assets/images/doctor1.png',
        imageBox: Colors.green,
        specialities: ['Dentist', 'Pediatrician'],
        score: 4.5,
        bio: "Has 20 years exp",
        calendar: [
          CalendarModel(dayNumber: 24, dayName: "Mon", isSelected: true),
          CalendarModel(dayNumber: 25, dayName: "Tue", isSelected: false),
          CalendarModel(dayNumber: 26, dayName: "Wed", isSelected: false),
          CalendarModel(dayNumber: 27, dayName: "Thu", isSelected: false),
        ],
        time: [
          TimeModel(time: "09.00 AM", isSelected: true),
          TimeModel(time: "12.00 AM", isSelected: false),
          TimeModel(time: "03.00 PM", isSelected: false),
        ],
      ),
    );

    doctors.add(
      DoctorModel(
        name: 'Dr. Asep Setiawan',
        image: 'assets/images/doctor2.png',
        imageBox: Colors.green,
        specialities: ['Obgyn'],
        score: 4.5,
        bio: "Has 20 years exp",
        calendar: [
          CalendarModel(dayNumber: 25, dayName: "Tue", isSelected: false),
        ],
        time: [
          TimeModel(time: "09.00 AM", isSelected: true),
          TimeModel(time: "12.00 AM", isSelected: false),
          TimeModel(time: "03.00 PM", isSelected: false),
        ],
      ),
    );

    doctors.add(
      DoctorModel(
        name: 'Dr. Sri Kurniasari',
        image: 'assets/images/doctor3.jpg',
        imageBox: Colors.green,
        specialities: ['Cardiologist', 'Pediatrician'],
        score: 4.5,
        bio: "Has 20 years exp",
        calendar: [
          CalendarModel(dayNumber: 26, dayName: "Wed", isSelected: false),
        ],
        time: [
          TimeModel(time: "09.00 AM", isSelected: true),
          TimeModel(time: "12.00 AM", isSelected: false),
          TimeModel(time: "03.00 PM", isSelected: false),
        ],
      ),
    );

    doctors.add(
      DoctorModel(
        name: 'Dr. John Doe',
        image: 'assets/images/doctor4.jpg',
        imageBox: Colors.green,
        specialities: ['Healthcare', 'Dentist'],
        score: 4.5,
        bio: "Has 20 years exp",
        calendar: [
          CalendarModel(dayNumber: 27, dayName: "Thu", isSelected: false),
        ],
        time: [
          TimeModel(time: "09.00 AM", isSelected: true),
          TimeModel(time: "12.00 AM", isSelected: false),
          TimeModel(time: "03.00 PM", isSelected: false),
        ],
      ),
    );

    doctors.add(
      DoctorModel(
        name: 'Dr. Leo',
        image: 'assets/images/doctor5.jpg',
        imageBox: Colors.green,
        specialities: ['Healthcare', 'Pediatrician'],
        score: 4.5,
        bio: "Has 20 years exp",
        calendar: [
          CalendarModel(dayNumber: 24, dayName: "Mon", isSelected: false),
        ],
        time: [
          TimeModel(time: "09.00 AM", isSelected: true),
          TimeModel(time: "12.00 AM", isSelected: false),
          TimeModel(time: "03.00 PM", isSelected: false),
        ],
      ),
    );

    return doctors;
  }
}

class CalendarModel {
  final int dayNumber;
  final String dayName;
  bool isSelected;

  CalendarModel({
    required this.dayNumber,
    required this.dayName,
    required this.isSelected,
  });
}

class TimeModel {
  final String time;
  bool isSelected;

  TimeModel({required this.time, required this.isSelected});
}
