import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownNumber<T> extends StatelessWidget {
  final String? hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T) onChanged;

  // ignore: use_key_in_widget_constructors
  const DropdownNumber({
    this.hintText,
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
            ),
          ),
          isEmpty: value == null || value == '',
          child: SizedBox(
            height: 18.h,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: value,
                isDense: true,
                onChanged: (data) {
                  if (data != null) {
                    onChanged(data);
                  }
                },
                items: options.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Text(
                      getLabel(value),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
