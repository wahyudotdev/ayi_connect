import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class FinishRegistrationScreen extends StatelessWidget {
  const FinishRegistrationScreen({Key? key}) : super(key: key);

  Widget _imPeople() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Assets.images.imPeople.image(),
    );
  }

  Widget _caption() {
    return Builder(builder: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.imOk.image(),
            Text(
              context.text.congratulations,
              style: context.textTheme.headline4?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              context.text.registrationSuccess,
              style: context.textTheme.bodyText1?.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 300,
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          _imPeople(),
          _caption(),
        ],
      ),
    );
  }
}
