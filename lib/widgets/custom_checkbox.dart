import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final String? hint;
  final bool? Function(bool?)? onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.label,
    this.hint,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(label),
      subtitle: hint != null ? Text(hint!) : null,
      value: value,
      onChanged: onChanged,
    );
  }
}
