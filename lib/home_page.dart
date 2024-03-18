import 'package:greenchargehub/consts.dart';
import 'package:greenchargehub/widgets/battery.dart';
import 'package:greenchargehub/widgets/closest_charging_banner.dart';
import 'package:greenchargehub/widgets/total_distance.dart';
import 'package:greenchargehub/widgets/weather.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade700,
        title: const Text("Find EV Charging"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add navigation logic here
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green.shade100,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 30.h,
                width: 100.w,
                color: black,
                padding: EdgeInsets.fromLTRB(5.w, 10.w, 5.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ',
                          style: roboto.copyWith(
                              fontSize: 13.f, color: white, height: 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'BMW i8',
                      style: roboto.copyWith(fontSize: 6.f, color: white),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: -7.h,
                right: 0,
                child: Image.asset(
                  'assets/bmw_i8.png',
                  width: 80.w,
                ),
              )
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50.w,
                  child: const BatteryScreen(),
                ),
                SizedBox(
                  width: 37.w,
                  child: Column(
                    children: [
                      const TotalDistance(),
                      SizedBox(height: 3.w),
                      const Weather(),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const ClosestChargingBanner(),
          )
        ],
      ),
    );
  }
}
