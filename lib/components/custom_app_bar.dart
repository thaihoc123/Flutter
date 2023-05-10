import 'package:flutter/material.dart';
import '/resourses/app_color.dart';
import 'dart:math' as m;

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback? leftPressed;
  final Color? color;
  const CustomAppBar({
    super.key,
    this.leftPressed,
    this.color = AppColor.white,
  });

  @override
  Widget build(BuildContext context) {
    double size = 25;
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20)
            .copyWith(top: MediaQuery.of(context).padding.top + 15, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: leftPressed,
              child: Transform.rotate(
                angle: m.pi / 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.white),
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(3, 3),
                            color: AppColor.grey,
                            blurRadius: 4,
                          ),
                        ]),
                    child: Transform.rotate(
                      angle: -m.pi / 4,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: size,
                        color: AppColor.brown,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text('All Todo List',
                style: TextStyle(
                    fontSize: size,
                    color: AppColor.blue,
                    fontWeight: FontWeight.bold)),
            CircleAvatar(
              backgroundImage: const AssetImage('assets/images/avatar_1.png'),
              radius: size,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
