import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.iconSize,
  }) : super(key: key);

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.transparent,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xff282a3a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Spacer(),
                  Icon(
                    Icons.home_outlined,
                    size: iconSize,
                    color: Colors.white,
                  ),
                  const Spacer(),
                ],
              ),
              Column(
                children: [
                  const Spacer(),
                  Icon(
                    Icons.search_outlined,
                    size: iconSize,
                    color: Colors.white,
                  ),
                  const Spacer(),
                ],
              ),
              Column(
                children: [
                  const Spacer(),
                  Icon(
                    Icons.adjust_outlined,
                    size: iconSize,
                    color: Colors.white,
                  ),
                  const Spacer(),
                ],
              ),
              Column(
                children: [
                  const Spacer(),
                  Icon(
                    Icons.task_alt_outlined,
                    size: iconSize,
                    color: Colors.white,
                  ),
                  const Spacer(),
                ],
              ),
              Column(
                children: [
                  const Spacer(),
                  Icon(
                    Icons.account_circle_outlined,
                    size: iconSize,
                    color: Colors.white,
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
