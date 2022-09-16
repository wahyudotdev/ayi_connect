import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/core/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SelectGenderCheeckbox extends StatefulWidget {
  const SelectGenderCheeckbox({Key? key}) : super(key: key);

  @override
  State<SelectGenderCheeckbox> createState() => _SelectGenderCheeckboxState();
}

class _SelectGenderCheeckboxState extends State<SelectGenderCheeckbox> {
  var selected = '';
  Widget _itemGender({required String title}) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.softGray,
        ),
        borderRadius: BorderRadius.circular(8.r),
        color: title == selected ? AppColors.secondary : null,
      ),
      child: Center(
        child: RadioListTile(
          value: title,
          activeColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          groupValue: selected,
          onChanged: (onChanged) {
            if (onChanged is String) {
              setState(() {
                selected = onChanged;
              });
            }
          },
          title: Text(
            title,
            style: context.textTheme.bodyText1?.copyWith(
              color: title == selected ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _grid() {
    return Builder(builder: (context) {
      return GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 20,
        children: [
          _itemGender(title: context.text.male),
          _itemGender(title: context.text.female),
          _itemGender(title: context.text.others),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.h,
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.marginHorizontal,
        vertical: AppTheme.marginVertical,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Text(
              context.text.selectYourGender,
              style: context.textTheme.bodyText1?.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Flexible(
            flex: 5,
            child: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                ? _grid()
                : Row(
                    children: [
                      Expanded(flex: 1, child: _grid()),
                      Expanded(flex: 2, child: Container())
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
