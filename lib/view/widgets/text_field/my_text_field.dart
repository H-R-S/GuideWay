import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? header;
  final bool isRequired;
  final String hint;
  final bool isPassword;
  final int minLine;
  final double? contentPadding;
  final Function(String)? onChanged;
  List<String>? dropDownList;
  bool isVisible;
  final bool isReadable;
  final Function()? onTap;
  final String? Function(String?)? validator;

  MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.dropDownList,
      this.onChanged,
      this.contentPadding,
      this.minLine = 1,
      this.header,
      this.isRequired = false,
      this.isVisible = false,
      this.isPassword = false,
      this.isReadable = false,
      this.onTap,
      this.validator});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          if (widget.header != null)
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(widget.header!,
                  style: TextStyle(
                      color: isDark ? Colors.white : null, fontSize: 16)),
              const SizedBox(width: 3),
              if (widget.isRequired)
                const Text("*",
                    style: TextStyle(fontSize: 16, color: Colors.red))
            ]),
          const SizedBox(height: 5),
          TextFormField(
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(color: isDark ? Colors.white : null),
              onChanged: widget.onChanged,
              maxLines: widget.minLine,
              readOnly: widget.isReadable,
              validator: widget.validator,
              obscureText: widget.isVisible,
              cursorColor: primary,
              controller: widget.controller,
              decoration: InputDecoration(
                  contentPadding: widget.contentPadding != null
                      ? EdgeInsets.all(widget.contentPadding!)
                      : null,
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isVisible = !widget.isVisible;
                            });
                          },
                          icon: Icon(
                              widget.isVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey))
                      : widget.dropDownList != null
                          ? PopupMenuButton<String>(
                              position: PopupMenuPosition.under,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              onSelected: (String value) {
                                widget.controller.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return widget.dropDownList!
                                    .map<PopupMenuItem<String>>((String value) {
                                  return PopupMenuItem(
                                      value: value, child: Text(value));
                                }).toList();
                              })
                          : null,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: widget.hint))
        ]));
  }
}
