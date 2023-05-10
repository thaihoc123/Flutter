import 'package:flutter/material.dart';
import '/resourses/app_color.dart';

class CustomAddTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool autofocus;
  const CustomAddTextField(
      {super.key, this.controller, this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.5).copyWith(left: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey),
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColor.grey,
            offset: Offset(3, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextField(
        autofocus: autofocus,
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Add a new todo item',
        ),
      ),
    );
  }
}
