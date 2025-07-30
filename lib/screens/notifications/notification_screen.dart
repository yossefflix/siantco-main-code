import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/utils/colors.dart';
import 'widgets/notification.dart';

List<Map<String, dynamic>> notifications = [
  {
    "date": "19 مايو 2025 مساءا",
    "notification": "⚡ تنبيه: تم فصل التيار الكهربائي مؤقتًا للصيانة",
  },
  {
    "date": "19 مايو 2025 مساءا",
    "notification":
        "⚠️ يرجى عدم استخدام الأجهزة الكهربائية أثناء أعمال الإصلاح.",
  },
  {
    "date": "19 مايو 2025 مساءا",
    "notification": "🛑 احذر: وجود أسلاك كهرباء مكشوفة – لا تقترب!",
  },
  {
    "date": "19 مايو 2025 مساءا",
    "notification": "🔧 جارٍ العمل على إصلاح عطل كهربائي طارئ في المنطقة.",
  },
  {
    "date": "19 مايو 2025 مساءا",
    "notification": "🔋 تم استعادة التيار الكهربائي بنجاح.",
  },
];

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite2,
      body: SingleChildScrollView(
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
                  "الإشعارات",
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w500,
                    color: cWhite,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Notification(
                    date: notification['date'],
                    notification: notification['notification'],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
