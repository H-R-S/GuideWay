import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/language/language_model.dart';
import '../../../theme/theme_provider.dart';

class SearchDropDown extends StatelessWidget {
  final String? header;
  final bool isRequired;
  final String hint;
  final List<String> items;
  final String? selectedItem;
  final Function(String?) onChanged;

  const SearchDropDown(
      {super.key,
      required this.items,
      required this.hint,
      required this.onChanged,
      this.selectedItem,
      this.header,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (header != null)
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(header!, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 3),
          if (isRequired)
            const Text("*", style: TextStyle(fontSize: 16, color: Colors.red))
        ]),
      const SizedBox(height: 5),
      Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: DropdownSearch<String>(
              popupProps: const PopupProps.menu(
                showSearchBox: true,
                showSelectedItems: true,
              ),
              selectedItem: selectedItem,
              items: items,
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(hintText: hint)),
              onChanged: onChanged))
    ]);
  }
}

class LanguageDropDown extends StatelessWidget {
  final String? header;
  final bool isRequired;
  final String hint;
  final List<Languages> items;
  final Languages? selectedItem;
  final Function(Languages?) onChanged;

  const LanguageDropDown(
      {super.key,
      required this.items,
      required this.hint,
      required this.onChanged,
      this.selectedItem,
      this.header,
      this.isRequired = false});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Column(children: [
      if (header != null)
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(header!, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 3),
          if (isRequired)
            const Text("*", style: TextStyle(fontSize: 16, color: Colors.red))
        ]),
      const SizedBox(height: 5),
      Container(
          padding: const EdgeInsets.only(left: 10, right: 5, top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: Theme(
            data: isDark ? ThemeData.dark() : ThemeData.light(),
            child: DropdownSearch<Languages>(
                itemAsString: (Languages language) {
                  return "${language.name} (${language.code!.toUpperCase()})";
                },
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                  // showSelectedItems: true,
                ),
                items: items,
                // selectedItem: selectedItem,
                dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: TextStyle(color: isDark ? Colors.white : null),
                    dropdownSearchDecoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: isDark ? Colors.white : null),
                        hintText: hint)),
                onChanged: onChanged),
          ))
    ]);
  }
}
