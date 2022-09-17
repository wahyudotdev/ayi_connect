import 'package:ayi_connect/core/widgets/app_colors.dart';
import 'package:ayi_connect/core/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ayi_connect/core/utils/theme_extension.dart';

class SpokenLanguange extends StatefulWidget {
  final String title;
  final String hint;
  final bool obscure;
  final Color textHintColor;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final Widget? endIcon;
  final Function? endIconClicked;
  final bool? readOnlyField;
  final TextInputType? keyboardType;
  final List<String>? choosenLanguage;
  const SpokenLanguange({
    Key? key,
    required this.title,
    required this.hint,
    this.obscure = false,
    this.textHintColor = Colors.black,
    this.controller,
    this.onChanged,
    this.errorText,
    this.endIcon,
    this.endIconClicked,
    this.readOnlyField,
    this.keyboardType,
    this.choosenLanguage,
  }) : super(key: key);

  @override
  State<SpokenLanguange> createState() => _SpokenLanguangeState();
}

class _SpokenLanguangeState extends State<SpokenLanguange> {
  bool isVisible = false;
  bool focused = false;
  bool alreadyClicked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.bold,
              color: widget.errorText != null && alreadyClicked
                  ? Colors.red
                  : focused && widget.textHintColor != Colors.white
                      ? AppColors.primary
                      : widget.textHintColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FocusScope(
            onFocusChange: (focus) {
              setState(() {
                focused = focus;
                alreadyClicked = true;
              });
            },
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  TextField(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.black),
                    obscureText: widget.obscure && isVisible == false,
                    controller: widget.controller,
                    onChanged: widget.onChanged,
                    readOnly: widget.readOnlyField == true,
                    keyboardType: widget.keyboardType,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.softGray,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: AppColors.softGray,
                        ),
                      ),
                      hintText: widget.choosenLanguage?.isNotEmpty ?? false
                          ? null
                          : widget.hint,
                      filled: true,
                      fillColor: Colors.white,
                      errorText: alreadyClicked ? widget.errorText : null,
                      suffixIcon: widget.obscure
                          ? InkWell(
                              onTap: () =>
                                  setState(() => isVisible = !isVisible),
                              child: Icon(isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )
                          : widget.endIcon != null
                              ? InkWell(
                                  child: widget.endIcon,
                                  onTap: () => widget.endIconClicked?.call(),
                                )
                              : null,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: widget.choosenLanguage?.isNotEmpty ?? false
                        ? Row(
                            children: widget.choosenLanguage!
                                .map((e) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0,
                                      ),
                                      child: Chip(
                                        label: Text(
                                          e,
                                          style: context.textTheme.bodyText2,
                                        ),
                                        backgroundColor: AppColors.secondary,
                                      ),
                                    ))
                                .toList(),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
