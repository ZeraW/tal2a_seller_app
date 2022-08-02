import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final String? hint;
  final int? maxLines;
  final double? width;
  final TextEditingController? controller;
  final TextInputType? keyType;
  final bool? isPassword, enabled;
  final int? maxLength;
  final Color? activeBorderColor;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onSubmitted;
  final Function(String?)? onChange;

  const TextFieldWidget(
      {Key? key,
      required this.title,
      this.maxLines = 1,
      this.width = double.infinity,
      this.controller,
      this.hint,
      this.keyType,
      this.isPassword,
      this.enabled = true,
      this.maxLength,
      this.activeBorderColor,
      this.focusNode,
      this.validator,
      this.onSubmitted,
      this.onChange})
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
            child: FormBuilderTextField(
              focusNode: focusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              name: title,
              enabled: enabled!,
              controller: controller,
              obscureText: isPassword ?? false,
              keyboardType: keyType ?? TextInputType.text,
              validator: validator,
              maxLength: maxLength,
              onChanged: onChange,
              onSubmitted: onSubmitted,
              textInputAction: TextInputAction.next,
              maxLines: maxLines,
              minLines: 1,
              textAlign: TextAlign.start,
              decoration: InputDecoration(hintText: hint),
            ),
          ),
        ],
      ),
    );
  }
}
