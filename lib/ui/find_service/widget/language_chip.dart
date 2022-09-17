import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/core/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageChips extends StatefulWidget {
  const LanguageChips({
    Key? key,
    this.initialValue,
    required this.onSelected,
  }) : super(key: key);
  final Function(List<String>) onSelected;
  final List<String>? initialValue;

  @override
  State<LanguageChips> createState() => _LanguageChipsState();
}

class _LanguageChipsState extends State<LanguageChips> {
  List<String> selected = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialValue?.isNotEmpty ?? false) {
      selected = widget.initialValue!;
    }
  }

  Widget _chip(String value) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 2.0,
        ),
        child: InputChip(
          label: Text(value),
          selectedColor: AppColors.secondary,
          labelStyle: context.textTheme.bodyText1?.copyWith(
            color:
                selected.contains(value) ? Colors.white : AppColors.textBlack,
          ),
          checkmarkColor: Colors.white,
          onSelected: (isSelected) {
            var lang = <String>[...selected];
            if (isSelected && !lang.contains(value)) {
              lang.add(value);
              widget.onSelected(lang);
              setState(() {
                selected = lang;
              });
            } else {
              lang.remove(value);
              widget.onSelected(lang);
              setState(() {
                selected = lang;
              });
            }
          },
          selected: selected.contains(value),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppTheme.marginVertical,
        horizontal: AppTheme.marginHorizontal,
      ),
      child: Row(
        children: [
          _chip(context.text.english),
          _chip(context.text.spanish),
          _chip(context.text.mandarin),
        ],
      ),
    );
  }
}
