import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_button.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/core/widgets/app_dropdown.dart';
import 'package:ayi_connect/core/widgets/app_textfield.dart';
import 'package:ayi_connect/core/widgets/app_theme.dart';
import 'package:ayi_connect/gen/assets.gen.dart';
import 'package:ayi_connect/ui/find_service/widget/find_service_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfessionalInformationScreen extends StatelessWidget {
  const ProfessionalInformationScreen({Key? key}) : super(key: key);

  Widget _etOccupation() {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(
          right: AppTheme.marginHorizontal,
          left: AppTheme.marginHorizontal,
          top: AppTheme.marginVertical,
        ),
        child: AppTextField(
          title: context.text.occupation,
          hint: context.text.occupationHint,
        ),
      );
    });
  }

  Widget _etCompany() {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(
          right: AppTheme.marginHorizontal,
          left: AppTheme.marginHorizontal,
          top: AppTheme.marginVertical,
        ),
        child: AppTextField(
          title: context.text.company,
          hint: context.text.companyHint,
        ),
      );
    });
  }

  Widget _etSpokenLanguage() {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(
          right: AppTheme.marginHorizontal,
          left: AppTheme.marginHorizontal,
          top: AppTheme.marginVertical,
        ),
        child: AppTextField(
          title: context.text.addLanguage,
          hint: context.text.addLanguageHint,
          endIcon: Assets.images.icPlus.image(),
          readOnlyField: true,
        ),
      );
    });
  }

  Widget _etPreferedService() {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(
          right: AppTheme.marginHorizontal,
          left: AppTheme.marginHorizontal,
          top: AppTheme.marginVertical,
        ),
        child: AppDropdown(
          title: context.text.preferedService,
          hint: context.text.preferedService,
          category: [
            context.text.childCare,
            context.text.homeCare,
            context.text.seniorCare,
            context.text.otherService,
          ],
          onSelected: (p0) => null,
          textHintColor: AppColors.textBlack,
        ),
      );
    });
  }

  Widget _etTellUsAboutYou() {
    return Builder(
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.marginHorizontal,
            vertical: AppTheme.marginVertical,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.text.tellUsAboutYou,
                style: context.textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              TextField(
                maxLines: null,
                minLines: 5,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: context.text.tellUsAboutYouHint,
                  hintMaxLines: 5,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(
                      color: AppColors.softGray,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _btnSubmit() {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.only(
          left: AppTheme.marginHorizontal,
          right: AppTheme.marginHorizontal,
          bottom: 40.h,
        ),
        child: AppButton(
          caption: context.text.submit,
          onPressed: () => null,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: findServiceAppBar(currentPos: 2),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _etOccupation(),
          ),
          SliverToBoxAdapter(
            child: _etCompany(),
          ),
          SliverToBoxAdapter(
            child: _etSpokenLanguage(),
          ),
          SliverToBoxAdapter(
            child: _etPreferedService(),
          ),
          SliverToBoxAdapter(
            child: _etTellUsAboutYou(),
          ),
          SliverToBoxAdapter(
            child: _btnSubmit(),
          ),
        ],
      ),
    );
  }
}
