import 'package:flutter/material.dart';
import '/resourses/app_color.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomAddButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.blue,
          border: Border.all(color: AppColor.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: AppColor.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
