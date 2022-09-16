import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/widgets/app_button.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class ItemServiceCategory extends StatelessWidget {
  final Widget image;
  final String caption;
  final Color baseColor;
  final Function onClick;
  final String btnCaption;
  const ItemServiceCategory({
    Key? key,
    required this.image,
    required this.caption,
    required this.baseColor,
    required this.onClick,
    required this.btnCaption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 280,
      padding: const EdgeInsets.symmetric(
        horizontal: 64,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          image,
          Text(
            caption,
            style: context.textTheme.bodyText1?.copyWith(
              color: AppColors.textBlack,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 200,
            child: AppButton(
              onPressed: onClick,
              caption: btnCaption,
              color: baseColor,
            ),
          )
        ],
      ),
    );
  }
}
