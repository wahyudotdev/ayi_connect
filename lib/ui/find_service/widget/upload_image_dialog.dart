import 'dart:io';

import 'package:ayi_connect/core/utils/media_service.dart';
import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef LetCallback<T> = T Function(T value);

extension ScopeFunctionsForObject<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType Function(T it) operationFor) {
    return operationFor(this);
  }
}

class UploadImageDialog extends StatelessWidget {
  UploadImageDialog({Key? key, this.onImagePicked}) : super(key: key);
  final MediaService mediaService = getIt<MediaService>();

  final Function(File image)? onImagePicked;

  Widget _icon({
    required Function onClick,
    required IconData icon,
    required String caption,
  }) {
    return Flexible(
      flex: 1,
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () => onClick.call(),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 36.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
                Text(
                  caption,
                  style: context.textTheme.bodyText1?.copyWith(
                    color: AppColors.textBlack,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 64.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _icon(
              icon: Icons.photo,
              caption: context.text.gallery,
              onClick: () async {
                final image = await mediaService.getImage(
                    context, AppImageSource.gallery);
                image?.let((it) {
                  onImagePicked?.call(it);
                  Navigator.of(context).pop();
                });
              }),
          _icon(
              icon: Icons.camera,
              caption: context.text.camera,
              onClick: () async {
                final image =
                    await mediaService.getImage(context, AppImageSource.camera);
                image?.let((it) {
                  onImagePicked?.call(it);
                  Navigator.of(context).pop();
                });
              }),
        ],
      ),
    );
  }
}
