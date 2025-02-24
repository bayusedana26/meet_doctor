import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meet_doctor/model/category_model.dart';
import 'package:meet_doctor/model/doctor_model.dart';
import 'package:meet_doctor/view/doctor_detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryModel> categoriesModel = CategoryModel.getCategories();
  final List<DoctorModel> doctorsModel = DoctorModel.getDoctors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [header(), categories(), doctors()],
      ),
    );
  }

  // Doctos section
  Widget doctors() {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        scrollDirection: Axis.vertical,

        itemBuilder: (context, index) {
          // Navigate to doctors detail view
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          DoctorDetailView(doctorModel: doctorsModel[index]),
                ),
              );
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(40),
                    offset: const Offset(0, 4),
                    blurRadius: 25,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: doctorsModel[index].imageBox,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage(doctorsModel[index].image),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorsModel[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          doctorsModel[index].specialities.first,
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
                            Text(doctorsModel[index].score.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: doctorsModel.length,
      ),
    );
  }

  // Categories section
  Column categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Container(
          height: 50,
          margin: const EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              // Navigate to other categories
              return GestureDetector(
                onTap: () {
                  for (var item in categoriesModel) {
                    item.isSelected = false;
                  }
                  categoriesModel[index].isSelected = true;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:
                            categoriesModel[index].isSelected
                                ? Colors.red
                                : Colors.black.withAlpha(40),
                        offset: const Offset(0, 4),
                        blurRadius: 25,
                      ),
                    ],
                    color:
                        categoriesModel[index].isSelected
                            ? Colors.red[600]
                            : Colors.white,
                  ),
                  child: SvgPicture.asset(
                    categoriesModel[index].vector,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 50),
            itemCount: categoriesModel.length,
          ),
        ),
      ],
    );
  }

  // Header
  Container header() {
    return Container(
      color: Colors.red[600],
      width: double.infinity,
      height: 350,
      padding: const EdgeInsets.all(16),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hi Bayu",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(40),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.notifications_active, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 15),

          Text(
            "Let's find\nYour top doctor!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),

          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search, color: Colors.black),
              hintText: "Search doctor...",
              hintStyle: TextStyle(fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
