import 'package:flutter/material.dart';
import 'package:meet_doctor/model/doctor_model.dart';

class DoctorDetailView extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorDetailView({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  offset: const Offset(0, 4),
                  blurRadius: 25,
                ),
              ],
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: true,
        title: Text("Schedule Appointment"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            doctorInfo(),
            // Biography & specialties
            // Calendar & time
            // Book appointment
          ],
        ),
      ),
    );
  }

  // Doctor info
  Widget doctorInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  color: doctorModel.imageBox,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(doctorModel.image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      doctorModel.specialities.first,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 5),
                        Text(doctorModel.score.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),
        Text(
          "Biography",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 10),
        Text(
          doctorModel.bio,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.black.withAlpha(150),
          ),
        ),
      ],
    );
  }
}
