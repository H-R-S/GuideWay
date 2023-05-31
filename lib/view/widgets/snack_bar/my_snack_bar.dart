// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

MySnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}