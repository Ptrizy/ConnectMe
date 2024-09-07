import 'package:flutter/material.dart';

class Shadows {
  static const BoxShadow s1 = BoxShadow(
    color: Color.fromRGBO(39, 39, 42, 0.15),
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const BoxShadow s2 = BoxShadow(
    color: Color.fromRGBO(39, 39, 42, 0.15),
    offset: Offset(0, 1),
    blurRadius: 8,
    spreadRadius: 0,
  );

  static const BoxShadow s3 = BoxShadow(
    color: Color.fromRGBO(39, 39, 42, 0.12),
    offset: Offset(0, 4),
    blurRadius: 16,
    spreadRadius: 0,
  );

  static const BoxShadow s4 = BoxShadow(
    color: Color.fromRGBO(39, 39, 42, 0.12),
    offset: Offset(0, 8),
    blurRadius: 24,
    spreadRadius: 0,
  );
}
