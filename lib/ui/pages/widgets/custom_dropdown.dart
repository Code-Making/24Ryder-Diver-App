import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';
import 'package:rideapp/ui/pages/widgets/textstyles.dart';

class CustomDropdownField extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final Color? backgroundColor;

  const CustomDropdownField({
    Key? key,
    required this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.contentPadding,
    this.enabled = true,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade400),
        ),
        padding: widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedValue,
            isExpanded: true,
            hint: Text(
              widget.hintText,
              style: AppTextStyles.normal.copyWith(
                color: "#A0A0A0".toHex(),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            items: widget.items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(item,
                          style: AppTextStyles.normal.copyWith(fontSize: 16)),
                    ))
                .toList(),
            onChanged: widget.enabled
                ? (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(newValue);
                    }
                  }
                : null,
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            dropdownColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
