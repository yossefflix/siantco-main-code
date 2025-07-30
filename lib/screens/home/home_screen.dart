import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siantko/screens/association/association_screen.dart';
import 'package:siantko/screens/home/widgets/custom_container.dart';
import 'package:siantko/utils/colors.dart';

List<Map<String, dynamic>> associations = [
  {
    "title": "جمعية صباح السالم",
    "description": "صباح السالم لوازم العائلة 4",
    "image": "assets/images/demo.png",
    "association_services": [
      {"image": "assets/images/Mask-group-4.png", "title": "كهرباء"},
      {"image": "assets/images/Mask-group-3.jpg", "title": "صحى"},
      {"image": "assets/images/Mask-group-1.png", "title": "ستلايت"},
      {"image": "assets/images/Mask-group-2.jpg", "title": "نجار"},
    ],
  },
  {
    "title": "جمعية صباح الأحمد",
    "description": "صباح الأحمد لوازم العائلة 4",
    "image": "assets/images/demo2.jpg",
    "association_services": [
      {"image": "assets/images/Mask-group-4.png", "title": "كهرباء"},
      {"image": "assets/images/Mask-group-3.jpg", "title": "صحى"},
      {"image": "assets/images/Mask-group-1.png", "title": "ستلايت"},
      {"image": "assets/images/Mask-group-2.jpg", "title": "نجار"},
    ],
  },
  {
    "title": "جمعية مبارك الكبير والقرين",
    "description": "صباح الأحمد لوازم العائلة 4",
    "image": "assets/images/demo3.jpg",
    "association_services": [
      {"image": "assets/images/Mask-group-4.png", "title": "كهرباء"},
      {"image": "assets/images/Mask-group-3.jpg", "title": "صحى"},
      {"image": "assets/images/Mask-group-1.png", "title": "ستلايت"},
      {"image": "assets/images/Mask-group-2.jpg", "title": "نجار"},
    ],
  },
  {
    "title": "الجمعية الطبية الكويتية",
    "description": "صباح الأحمد لوازم العائلة 4",
    "image": "assets/images/demo4.png",
    "association_services": [
      {"image": "assets/images/Mask-group-4.png", "title": "كهرباء"},
      {"image": "assets/images/Mask-group-3.jpg", "title": "صحى"},
      {"image": "assets/images/Mask-group-1.png", "title": "ستلايت"},
      {"image": "assets/images/Mask-group-2.jpg", "title": "نجار"},
    ],
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: cWhite, height: 0.2.h),
          Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: cBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: cGrey,
                  hintText: 'ابحث هنا عن الجمعيات',
                  hintStyle: TextStyle(color: Colors.grey[700]),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: Icon(Icons.mic, color: Colors.black),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: associations.length,
            itemBuilder: (context, index) {
              final association = associations[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CustomContainer(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AssociationScreen(
                          associationName: association['title'],
                          associationServices:
                              association['association_services'],
                        ),
                      ),
                    );
                  },
                  title: association['title'],
                  description: association['description'],
                  image: association['image'],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
