import 'package:flutter/material.dart';
import 'package:meet_doctor/model/doctor_model.dart';

class DoctorDetailView extends StatefulWidget {
  final DoctorModel doctorModel;

  const DoctorDetailView({super.key, required this.doctorModel});

  @override
  State<DoctorDetailView> createState() => _DoctorDetailViewState();
}

class _DoctorDetailViewState extends State<DoctorDetailView> {
  List<CalendarModel> calendarModel = [];
  List<TimeModel> timeModel = [];

  @override
  void initState() {
    super.initState();
    calendarModel = widget.doctorModel.calendar;
    timeModel = widget.doctorModel.time;
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            doctorInfo(),
            const SizedBox(height: 30),
            calendar(),
            const SizedBox(height: 20),
            time(),
          ],
        ),
      ),
    );
  }

  Widget time() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 20),

        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in timeModel) {
                    item.isSelected = false;
                  }
                  timeModel[index].isSelected = true;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        timeModel[index].isSelected
                            ? const Color(0xff51A8FF)
                            : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 25,
                        color:
                            timeModel[index].isSelected
                                ? const Color(0xff51A8FF).withOpacity(0.45)
                                : const Color(0xff050618).withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          timeModel[index].time,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color:
                                timeModel[index].isSelected
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 50),
            itemCount: timeModel.length,
          ),
        ),
      ],
    );
  }

  Widget calendar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Calendar',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 20),

        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  for (var item in calendarModel) {
                    item.isSelected = false;
                  }
                  calendarModel[index].isSelected = true;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        calendarModel[index].isSelected
                            ? const Color(0xff51A8FF)
                            : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 25,
                        color:
                            calendarModel[index].isSelected
                                ? const Color(0xff51A8FF).withOpacity(0.45)
                                : const Color(0xff050618).withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        calendarModel[index].dayNumber.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color:
                              calendarModel[index].isSelected
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                      Text(
                        calendarModel[index].dayName,
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                          color:
                              calendarModel[index].isSelected
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 50),
            itemCount: calendarModel.length,
          ),
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
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
                  color: widget.doctorModel.imageBox,
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(widget.doctorModel.image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctorModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.doctorModel.specialities.first,
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
                        Text(widget.doctorModel.score.toString()),
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
          widget.doctorModel.bio,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Colors.black.withAlpha(150),
          ),
        ),

        const SizedBox(height: 10),
        Text(
          "Specialties",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return Text(
                widget.doctorModel.specialities[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 5),
            itemCount: widget.doctorModel.specialities.length,
          ),
        ),
      ],
    );
  }
}
