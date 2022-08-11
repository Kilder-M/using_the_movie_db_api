import 'package:flutter/material.dart';

Widget imageNetworkWidget(String url) {
  return (Uri.tryParse(url)!.isAbsolute)
      ? Image.network(url)
      : const Icon(Icons.report_problem_outlined);
}
