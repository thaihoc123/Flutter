import 'package:flutter/material.dart';
import '/resourses/app_color.dart';

class CustomSearchBox extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const CustomSearchBox({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: AppColor.white),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: AppColor.grey,
              offset: Offset(3, 3),
              blurRadius: 6,
            ),
          ]),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Search',
          prefixIcon: Icon(Icons.search, color: AppColor.black),
          prefixIconConstraints: BoxConstraints(minWidth: 40),
        ),
      ),
    );
  }
}
