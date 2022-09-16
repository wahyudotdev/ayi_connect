import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/gen/assets.gen.dart';
import 'package:ayi_connect/ui/find_service/widget/find_service_app_bar.dart';
import 'package:ayi_connect/ui/find_service/widget/item_service_category.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  Widget _btnFindHelper() {
    return Builder(builder: (context) {
      return ResponsiveRowColumn(
        rowMainAxisSize: MainAxisSize.max,
        columnMainAxisSize: MainAxisSize.max,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        rowMainAxisAlignment: MainAxisAlignment.center,
        columnMainAxisAlignment: MainAxisAlignment.center,
        layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
            child: ItemServiceCategory(
              image: Assets.images.imHelper.image(),
              caption: context.text.findAHelperHint,
              baseColor: AppColors.primary,
              onClick: () => context.push('/personal_information'),
              btnCaption: context.text.findAHelper,
            ),
          ),
          ResponsiveRowColumnItem(
            child: ItemServiceCategory(
              image: Assets.images.imJob.image(),
              caption: context.text.findAJobHint,
              baseColor: AppColors.secondary,
              onClick: () => null,
              btnCaption: context.text.findAJob,
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: findServiceAppBar(currentPos: 0),
      body: Center(
        child: _btnFindHelper(),
      ),
    );
  }
}
