import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/ui/find_service/widget/dropdown_number.dart';
import 'package:ayi_connect/core/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberField extends HookWidget {
  const PhoneNumberField({Key? key}) : super(key: key);

  Widget _countryCode() {
    var selected = useState('+62');
    return Flexible(
      flex: 1,
      child: DropdownNumber<String>(
        getLabel: (getLabel) => selected.value,
        value: selected.value,
        onChanged: (value) => selected.value = value,
        options: const ['+62', '+1'],
      ),
    );
  }

  Widget _phoneNumber() {
    return Flexible(
      flex: 3,
      child: Builder(builder: (context) {
        return TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
            hintStyle: context.textTheme.bodyText1,
            hintText: 'XXXXXXXXXX',
          ),
          style: context.textTheme.bodyText1,
          keyboardType: TextInputType.number,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: AppTheme.marginHorizontal,
        vertical: AppTheme.marginVertical,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 12.h,
            ),
            child: Text(
              context.text.phoneNumber,
              style: context.textTheme.bodyText1?.copyWith(
                color: AppColors.textBlack,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              _countryCode(),
              _phoneNumber(),
            ],
          ),
        ],
      ),
    );
  }
}
