import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

class MySearchBar extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function()? onTap;
  final String hint;
  final bool isReadOnly;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Function(String) onChanged;
  final IconData? sufixIcon;
  final Function()? onTapSufix;

  const MySearchBar(
      {super.key,
      this.validator,
      this.onTap,
      required this.hint,
      this.isReadOnly = false,
      this.prefixIcon = Icons.search,
      required this.controller,
      required this.onChanged,
      this.sufixIcon,
      this.onTapSufix});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(color: isDark ? Colors.white : null),
        validator: validator,
        readOnly: isReadOnly,
        onTap: onTap,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Image.asset(searchIcon, height: 10))),
            suffixIcon: sufixIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                        onTap: onTapSufix,
                        child: Icon(sufixIcon, color: light)))
                : null,
            hintText: hint,
            hintStyle: const TextStyle(color: light),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: light),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: light),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: light),
                borderRadius: BorderRadius.circular(15))));
  }
}
