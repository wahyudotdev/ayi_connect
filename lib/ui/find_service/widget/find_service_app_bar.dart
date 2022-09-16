import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/widgets/app_colors.dart';

Widget _roundedNumber({
  required String caption,
  bool selected = false,
  int currentPos = 0,
}) {
  return Builder(builder: (context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        selected
            ? const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 28,
              )
            : Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    '$currentPos',
                    style: context.textTheme.bodyText1?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
        Container(
          width: 100,
          margin: const EdgeInsets.only(
            top: 12,
          ),
          child: Text(
            caption,
            style: context.textTheme.bodyText1?.copyWith(
              color: Colors.white,
              fontWeight: selected ? FontWeight.bold : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  });
}

class _AppBarWidget extends HookWidget {
  final int currentPos;

  Widget _line() {
    return Builder(builder: (context) {
      late double width;
      if (ResponsiveWrapper.of(context).isLargerThan(TABLET)) {
        width = 120.w;
      } else if (ResponsiveWrapper.of(context).isLargerThan(PHONE)) {
        width = 64.w;
      } else {
        width = 56.w;
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              width: width,
              height: 2,
              color: Colors.white,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          )
        ],
      );
    });
  }

  const _AppBarWidget(this.currentPos);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _roundedNumber(
            caption: context.text.selectYourRole,
            selected: currentPos > 0,
            currentPos: 1,
          ),
          _line(),
          _roundedNumber(
            caption: context.text.personalInformation,
            selected: currentPos > 1,
            currentPos: 2,
          ),
          _line(),
          _roundedNumber(
            caption: context.text.profesionalInformation,
            selected: currentPos > 2,
            currentPos: 3,
          ),
        ],
      ),
    );
  }
}

AppBar findServiceAppBar({required int currentPos}) => AppBar(
      backgroundColor: AppColors.primary,
      toolbarHeight: 150,
      automaticallyImplyLeading: false,
      flexibleSpace: _AppBarWidget(currentPos),
    );
