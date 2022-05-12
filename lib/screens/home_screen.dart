import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:win/ui/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int time = 25;
  int breakTime = 5;
  int co = 0;
  double cyrcle = 0;
  Timer? timer;
  late Color apps = AppColor.startColor;
  int counter = 25 * 60;

  void _startTimer(int timeInMinutes) {
    counter = timeInMinutes * 60;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          counter--;
          if (counter < 6) {
            apps = AppColor.endColor;
          } else {
            apps = AppColor.startColor;
          }
          cyrcle = 1 - counter / (co * 60);
          if (cyrcle == 1) {
            cyrcle = 0;
            apps = AppColor.startColor;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: const Text("Mening birinchi windows dasturim"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                children: [
                  CircularPercentIndicator(
                    radius: max(160, MediaQuery.of(context).size.width / 10),
                    lineWidth: 24.0,
                    center: Padding(
                      padding: const EdgeInsets.only(left: 42),
                      child: Text(
                        "${counter ~/ 60 < 10 ? "0" + (counter ~/ 60).toString() : counter ~/ 60}:"
                            "${counter % 60 < 10 ? "0" + (counter % 60).toString() : counter % 60}  ",
                        style: TextStyle(
                            color: apps,
                            fontSize: max(
                                100, MediaQuery.of(context).size.width / 16)),
                      ),
                    ),
                    percent: cyrcle,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: AppColor.cyrcleColor,
                    backgroundColor: AppColor.cyrcleBackroundColor,
                  ),
                ],
              )),
          const SizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                onPressed: () {
                  if (timer != null) {
                    timer!.cancel();
                  }
                  cyrcle = 0;
                  co = 25;
                  _startTimer(25);
                },
                fillColor: AppColor.secondaryColor,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 64.0),
                child: const Text(
                  "Ishlash",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              RawMaterialButton(
                onPressed: () {
                  if (timer != null) {
                    timer!.cancel();
                  }
                  cyrcle = 0;
                  co = 5;
                  _startTimer(5);
                },
                fillColor: AppColor.secondaryColor,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 64.0),
                child: const Text(
                  "Dam olish",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
