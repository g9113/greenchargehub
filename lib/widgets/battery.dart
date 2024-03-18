import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:greenchargehub/consts.dart';
import 'package:greenchargehub/widgets/wave_progress.dart';
import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({
    super.key,
  });

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  late Battery battery;
  int batteryLevel = 0;
  double myDoubleValue = 0.0;
  double batteryprogress = 0.0;

  @override
  void initState() {
    super.initState();
    battery = Battery();
    getBatteryLevel();
    batteryprogress = convertIntToDouble(batteryLevel);
    setState(() {
      batteryprogress = batteryprogress;
    });
  }

  Future<void> getBatteryLevel() async {
    final batteryInfo = await battery.batteryLevel;

    setState(() {
      batteryLevel = batteryInfo;
    });
  }

  double convertIntToDouble(int intValue) {
    return intValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.5.w),
      decoration: BoxDecoration(
          color: white, borderRadius: BorderRadius.circular(2.5.w)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BatteryScreen',
                    style: roboto.copyWith(
                        fontSize: 9.f,
                        color: black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Last charge 2w ago',
                    style: roboto.copyWith(
                        fontSize: 5.f, color: black.withOpacity(.4)),
                  )
                ],
              ),
              
            ],
          ),
          const SizedBox(height: 15),
          Row(children: [
            Column(
              children: [
                Container(
                  width: 30,
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: grey.shade200),
                ),
                const SizedBox(height: 3),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Container(
                    width: 50,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: grey.shade200),
                    child: WaveProgress(
                        waveColor: blue, progress: convertIntToDouble(batteryLevel)),
                  ),
                ),
              ],
            ),
            SizedBox(width: 2.5.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          style: roboto.copyWith(
                              color: black, fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: "${batteryLevel*5}",
                            style: roboto.copyWith(fontSize: 12.f)),
                        TextSpan(
                            text: ' km', style: roboto.copyWith(fontSize: 7.f)),
                      ])),
                  const Divider(),
                  RichText(
                      text: TextSpan(
                          style: roboto.copyWith(
                              color: black, fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                            text: batteryLevel.toString() + "%",
                            style: roboto.copyWith(fontSize: 6.f)),
                        TextSpan(
                            text: ' 120 kv',
                            style: roboto.copyWith(
                                fontSize: 5.f, color: black.withOpacity(.4))),
                      ])),
                ],
              ),
            )
          ]),
          const SizedBox(height: 15),
          Text(
            'Saving Mode BatteryScreen',
            style: roboto.copyWith(fontSize: 5.f, color: black.withOpacity(.4)),
          )
        ],
      ),
    );
  }
}
