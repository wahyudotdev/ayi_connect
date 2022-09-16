import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ayi_connect/core/utils/theme_extension.dart';

import 'app_colors.dart';

class AppDropdown extends StatefulWidget {
  final List<String> category;
  final String title;
  final String hint;
  final Color textHintColor;
  final String? errorText;
  final Function(String) onSelected;
  const AppDropdown({
    Key? key,
    required this.category,
    required this.title,
    required this.hint,
    required this.textHintColor,
    this.errorText,
    required this.onSelected,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  bool focused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (focus) => setState(() => focused = focus),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.textTheme.bodyText2?.copyWith(
              color: widget.errorText != null
                  ? Colors.red
                  : focused && widget.textHintColor != Colors.white
                      ? AppColors.primary
                      : widget.textHintColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownButtonFormField<String>(
            isDense: true,
            hint: Text(widget.hint),
            value: widget.category.first,
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            items: widget.category
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: (item) => setState(() {
              var i = item as String;
              widget.onSelected(i);
            }),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 8,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.softGray,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(
                  color: AppColors.softGray,
                ),
              ),
              hintText: widget.hint,
              filled: true,
              fillColor: Colors.white,
              errorText: widget.errorText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.black),
            ),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
