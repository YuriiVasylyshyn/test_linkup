import 'package:flutter/material.dart';

navigationReset(context, screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
