import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/view/next-days/components/app_bar.dart';
import 'package:weather/view/next-days/components/bottom_list.dart';
import 'package:weather/view/next-days/components/days_list.dart';
import 'package:weather/view_model/controllers/days_controller.dart';
import 'package:weather/view_model/controllers/home_controller.dart';
import 'components/center_card.dart';


class NextDays extends StatefulWidget {

  NextDays({super.key});

  @override
  State<NextDays> createState() => _NextDaysState();
}

class _NextDaysState extends State<NextDays> {
  final homeController = Get.put(HomeController());

  final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 1,
                child: Container(
                  height: size.height / 1.8,
                  width: size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff6ac5fe),
                            Color(0xff45b6fe),
                            Color(0xff45b6fe),
                            // Colors.blue
                          ])),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomAppBar(),
                      const SizedBox(
                        height: 20,
                      ),
                      DaysList(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                child: Container(
                  height: size.height / 1.7,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ),
              ),
              BottomList(),
              Hero(
                tag: 'TAG',
                child: Material(color: Colors.transparent, child: CenterCard()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
