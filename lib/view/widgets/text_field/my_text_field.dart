import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? header;
  final bool isRequired;
  final String hint;
  final bool isPassword;
  final bool isPhoneNumber;
  final int minLine;
  final bool isCategories;
  final Color? filledColor;
  final Function(String)? onChanged;
  bool isVisible;
  final IconData? suffixIcon;
  final Function()? onTapSuffix;
  final bool isReadable;
  final Function()? onTap;
  final String? Function(String?)? validator;

  MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.suffixIcon,
      this.onTapSuffix,
      this.onChanged,
      this.minLine = 1,
      this.header,
      this.filledColor,
      this.isPhoneNumber = false,
      this.isRequired = false,
      this.isVisible = false,
      this.isPassword = false,
      this.isReadable = false,
      this.isCategories = false,
      this.onTap,
      this.validator});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          if (widget.header != null)
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(widget.header!, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 3),
              if (widget.isRequired)
                const Text("*",
                    style: TextStyle(fontSize: 16, color: Colors.red))
            ]),
          const SizedBox(height: 5),
          TextFormField(
              onChanged: widget.onChanged,
              maxLines: widget.minLine,
              readOnly: widget.isReadable,
              validator: widget.validator,
              obscureText: widget.isVisible,
              cursorColor: Colors.grey,
              controller: widget.controller,
              decoration: InputDecoration(
                  fillColor: widget.filledColor,
                  filled: widget.filledColor != null,
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
                              color: Colors.grey),
                        )
                      : widget.suffixIcon != null
                          ? IconButton(
                              onPressed: widget.onTapSuffix,
                              icon: Icon(widget.suffixIcon))
                          : null,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  hintText: widget.hint))
        ]));
  }
}
