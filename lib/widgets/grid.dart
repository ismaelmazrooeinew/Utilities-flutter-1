import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';
import 'package:utilities/utils/theme.dart';

Widget gridHeader(final String title) => Center(child: Text(title, textAlign: TextAlign.center).headline3());

Widget gridRow(final String title) => Container(
      alignment: Alignment.center,
      child: Text(title, textAlign: TextAlign.center).bodyText1(),
    );

Widget gridSwipeButton({
  required final String title,
  required final VoidCallback onTap,
  required final Color backgroundColor,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: backgroundColor,
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 15)),
      ),
    );

Widget getRow(final String value) => Center(child: Text(value));

Widget getRowColor(final String value) => Center(
        child: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: hexStringToColor(value)),
    ));

Widget getEditRow(
  final CategoryReadDto? value, {
  required final Function(CategoryReadDto categoryReadDto) onEditTap,
  required final Function(CategoryReadDto categoryReadDto) onDeleteTap,
}) =>
    Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.red,
          child: image(AppIcons.edit2, width: 16, height: 16),
        ).onTap(() {
          onEditTap(value!);
        }),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.red,
          child: image(AppIcons.trash, width: 16, height: 16),
        ).onTap(() {
          onDeleteTap(value!);
        }),
      ],
    ));

Widget getRowCategoryTitle(final CategoryReadDto? value, final String? imageUseCase) {
  String? _image = AppIcons.image;
  if (imageUseCase != null) {
    _image = value?.media?.getImage(useCase: imageUseCase) != "--" ? value?.media?.getImage(useCase: imageUseCase) : _image;
  }
  return Center(
      child: Row(
    children: <Widget>[
      imageUseCase != null
          ? Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.blueLight,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: image(_image ?? AppIcons.image, width: 16, height: 16, color: AppColors.card)),
            ).marginSymmetric(horizontal: 16)
          : Container(),
      Text(value?.title ?? '').subtitle1(),
    ],
  ));
}

Widget getRowUserTitle(final UserReadDto? value, final String? imageUseCase) {
  String? _image = AppIcons.profile;
  if (imageUseCase != null) {
    _image = value?.media?.getImage(useCase: imageUseCase) != "--" ? value?.media?.getImage(useCase: imageUseCase) : _image;
  }
  return Center(
      child: Row(
    children: <Widget>[
      imageUseCase != null
          ? Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.blueLight,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: image(_image ?? AppIcons.image, width: 16, height: 16, color: AppColors.card)),
            ).marginSymmetric(horizontal: 16)
          : Container(),
      Text(value?.userName ?? '').subtitle1(),
    ],
  ));
}

Widget getRowProductTitle(final ProductReadDto? value, final String? imageUseCase) {
  String? _image = AppIcons.image;
  if (imageUseCase != null) {
    _image = value?.media?.getImage(useCase: imageUseCase) != "--" ? value?.media?.getImage(useCase: imageUseCase) : _image;
  }
  return Center(
      child: Row(
    children: <Widget>[
      imageUseCase != null
          ? Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.blueLight,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: image(_image ?? AppIcons.image, width: 16, height: 16, color: AppColors.card)),
            ).marginSymmetric(horizontal: 16)
          : Container(),
      Text(value?.title ?? '').subtitle1(),
    ],
  ));
}
