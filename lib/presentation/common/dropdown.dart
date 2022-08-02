import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/responsive.dart';
import '../resources/styles_manager.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../resources/values_manager.dart';

class DropDownWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final double? width;
  final bool? isRequired;
  final String? errorText;
  final List<String> list;

  const DropDownWidget(
      {Key? key,
      required this.title,
      this.width = double.infinity,
      this.hint,
      this.isRequired = true,
      this.errorText = 'الحقل مطلوب',required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: getSemiBoldStyle(color: ColorManager.grey1)),
          const SizedBox(
            height: AppSize.s6,
          ),
          SizedBox(
            width: width,
            child: FormBuilderDropdown(
              name: title,
              decoration: InputDecoration(hintText: hint),
              // initialValue: 'Male',
              allowClear: isRequired!? false :true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              dropdownColor: Colors.white,
              focusColor: Colors.transparent,
              menuMaxHeight: 200,
              validator: isRequired!
                  ? (value) {
                      if (value == null) {
                        return "× $errorText";
                      }
                      return null;
                    } : null,
              items: list.map((val) => DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
