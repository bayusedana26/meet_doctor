import 'package:flutter/material.dart';

class DoctorModel {
  String name;
  String image;
  Color imageBox;
  List<String> specialities;
  double score;
  String bio;

  DoctorModel({
    required this.name,
    required this.image,
    required this.imageBox,
    required this.specialities,
    required this.score,
    required this.bio,
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
      ),
    );

    return doctors;
  }
}
