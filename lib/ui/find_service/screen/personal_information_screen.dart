import 'package:ayi_connect/core/utils/theme_extension.dart';
import 'package:ayi_connect/core/utils/translation.dart';
import 'package:ayi_connect/core/widgets/app_button.dart';
import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/core/widgets/app_dropdown.dart';
import 'package:ayi_connect/core/widgets/app_textfield.dart';
import 'package:ayi_connect/core/widgets/app_theme.dart';
import 'package:ayi_connect/core/widgets/app_ui_extension.dart';
import 'package:ayi_connect/di/injection.dart';
import 'package:ayi_connect/gen/assets.gen.dart';
import 'package:ayi_connect/ui/find_service/bloc/personal_information_bloc.dart';
import 'package:ayi_connect/ui/find_service/widget/find_service_app_bar.dart';
import 'package:ayi_connect/ui/find_service/widget/phone_number_field.dart';
import 'package:ayi_connect/ui/find_service/widget/select_gender_checkbox.dart';
import 'package:ayi_connect/ui/find_service/widget/upload_image_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  Widget _addProfilePhoto() {
    return BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
        buildWhen: (previous, current) => current is PhotoChoosenState,
        builder: (context, state) {
          final controller = TextEditingController(
              text: state is PhotoChoosenState ? state.photo.path : null);
          return Container(
            padding: EdgeInsets.only(
              left: AppTheme.marginHorizontal,
              right: AppTheme.marginHorizontal,
              bottom: AppTheme.marginVertical,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: state is PhotoChoosenState
                        ? kIsWeb
                            ? CircleAvatar(
                                foregroundImage: NetworkImage(state.photo.path),
                              )
                            : CircleAvatar(
                                foregroundImage: FileImage(state.photo),
                              )
                        : Assets.images.imPhoto.image(),
                  ),
                ),
                Flexible(
                  flex: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                      ? 3
                      : 8,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        title: context.text.addProfilePhoto,
                        hint: context.text.addProfilePhoto,
                        controller: controller,
                        endIcon: Assets.images.icPlus.image(),
                        endIconClicked: () => context.openBottomSheet(
                          builder: (builder) => UploadImageDialog(
                            onImagePicked: (image) {
                              context
                                  .read<PersonalInformationBloc>()
                                  .add(ChoosePhotoEvent(image));
                            },
                          ),
                        ),
                        textHintColor: Colors.white,
                        readOnlyField: true,
                      ),
                      Text(
                        context.text.addPhotoHint,
                        style: context.textTheme.bodyText2?.copyWith(
                          color: AppColors.textGray,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _twoLines() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppTheme.marginHorizontal,
      ),
      child: Column(
        children: [
          Container(
            height: 1,
            color: AppColors.textGray,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 1,
            color: AppColors.textGray,
          ),
        ],
      ),
    );
  }

  Widget _etFullName() {
    return Builder(builder: (context) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: AppTheme.marginHorizontal,
          right: AppTheme.marginHorizontal,
          top: AppTheme.marginVertical,
        ),
        child: AppTextField(
          title: context.text.fullName,
          hint: context.text.fullNameHint,
        ),
      );
    });
  }

  Widget _etChooseBirthDate() {
    return Builder(builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.marginHorizontal,
        ),
        child: AppTextField(
          title: context.text.chooseBirthDate,
          hint: 'MM/DD/YYYY',
          endIcon: Assets.images.icCalendar.image(),
        ),
      );
    });
  }

  Widget _ddCurrentLocation() {
    return BlocBuilder<PersonalInformationBloc, PersonalInformationState>(
        buildWhen: (previous, current) => current is ProvinceListState,
        builder: (context, state) {
          final dd = AppDropdown(
            category: state is ProvinceListState
                ? state.data.map((e) => e.name ?? '').toList()
                : ['category'],
            title: context.text.currentLocation,
            hint: context.text.currentLocationHint,
            textHintColor: AppColors.textBlack,
            onSelected: ((p0) => null),
          );
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: AppTheme.marginHorizontal,
            ),
            child: dd,
          );
        });
  }

  Widget _btnNext() {
    return Builder(builder: (context) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppTheme.marginHorizontal,
          vertical: AppTheme.marginVertical,
        ),
        child: AppButton(
          onPressed: () => context.push('/professional_information'),
          caption: context.text.next,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PersonalInformationBloc>()..add(GetProvinceEvent()),
      child: Scaffold(
        appBar: findServiceAppBar(currentPos: 1),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _addProfilePhoto(),
            ),
            SliverToBoxAdapter(
              child: _twoLines(),
            ),
            SliverToBoxAdapter(
              child: _etFullName(),
            ),
            const SliverToBoxAdapter(
              child: SelectGenderCheeckbox(),
            ),
            SliverToBoxAdapter(
              child: _etChooseBirthDate(),
            ),
            const SliverToBoxAdapter(
              child: PhoneNumberField(),
            ),
            SliverToBoxAdapter(
              child: _ddCurrentLocation(),
            ),
            SliverToBoxAdapter(
              child: _btnNext(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
