import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/screens/orders/oder_details_screen.dart';
import 'package:siantko/screens/orders/widgets/order.dart';
import 'package:siantko/utils/colors.dart';

List<Map<String, dynamic>> orders = [
  {
    'serviceName': "صحى",
    'date': "19 مايو 2025 مساءا",
    'location': "صباح السالم لوازم العائلة 4",
    'image': "assets/images/d1.png",
    "rating": 3.0,
    "orderStatus": "تحت المراجعة",
    "technicalName": "لم يتم التحديد بعد",
    "percentageStatus": 0.5,
    "note":
        "تواجه المنازل أحيانًا مشاكل في السباكة مثل تسريب المياه أو انسداد الصرف.  هذه المشكلات قد تؤدي إلى تلف الجدران وزيادة فواتير المياه إذا لم تُعالج بسرعة.",
    "images": [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.png',
    ],
    'lat': 30.033333,
    'lng': 31.233334,
  },
  {
    'serviceName': "كهرباء",
    'date': "19 مايو 2025 مساءا",
    'location': "صباح السالم لوازم العائلة 4",
    'image': "assets/images/d2.png",
    "rating": 3.0,
    "orderStatus": "تمت المراجعة",
    "technicalName": "لم يتم التحديد بعد",
    "percentageStatus": 0.5,
    "note":
        "تواجه المنازل أحيانًا مشاكل في السباكة مثل تسريب المياه أو انسداد الصرف.  هذه المشكلات قد تؤدي إلى تلف الجدران وزيادة فواتير المياه إذا لم تُعالج بسرعة.",
    "images": [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.png',
    ],
    'lat': 30.033333,
    'lng': 31.233334,
  },
  {
    'serviceName': "ستلايت",
    'date': "19 مايو 2025 مساءا",
    'location': "صباح السالم لوازم العائلة 4",
    'image': "assets/images/d3.png",
    "rating": 3.0,
    "orderStatus": "تحت المراجعة",
    "technicalName": "لم يتم التحديد بعد",
    "percentageStatus": 0.5,
    "note":
        "تواجه المنازل أحيانًا مشاكل في السباكة مثل تسريب المياه أو انسداد الصرف.  هذه المشكلات قد تؤدي إلى تلف الجدران وزيادة فواتير المياه إذا لم تُعالج بسرعة.",
    "images": [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.png',
    ],
    'lat': 30.033333,
    'lng': 31.233334,
  },
  {
    'serviceName': "نجار",
    'date': "19 مايو 2025 مساءا",
    'location': "صباح السالم لوازم العائلة 4",
    'image': "assets/images/d4.png",
    "rating": 3.0,
    "orderStatus": "تحت المراجعة",
    "technicalName": "لم يتم التحديد بعد",
    "percentageStatus": 0.5,
    "note":
        "تواجه المنازل أحيانًا مشاكل في السباكة مثل تسريب المياه أو انسداد الصرف.  هذه المشكلات قد تؤدي إلى تلف الجدران وزيادة فواتير المياه إذا لم تُعالج بسرعة.",
    "images": [
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.png',
    ],
    'lat': 30.033333,
    'lng': 31.233334,
  },
];

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
            child: Center(
              child: Text(
                "الطلبات",
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w500,
                  color: cWhite,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            padding: const EdgeInsets.all(8.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Order(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OderDetailsScreen(
                          technicalName: order['technicalName'],
                          serviceName: order['serviceName'],
                          percentageStatus: order['percentageStatus'],
                          orderStatus: order['orderStatus'],
                          note: order['note'],
                          location: order['location'],
                          initialRating: order['rating'],
                          image: order['image'],
                          date: order['date'],
                          images: order['images'],
                          lat: order['lat'],
                          lng: order['lng'],
                        ),
                      ),
                    );
                  },
                  serviceName: order['serviceName'],
                  date: order['date'],
                  image: order['image'],
                  initialRating: order['rating'],
                  location: order['location'],
                  orderStatus: order['orderStatus'],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
