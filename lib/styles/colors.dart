import 'dart:math';
import 'dart:ui';

class AppColors {
  static const borderColor = Color(0xFFDFDEDE);
  static const focusedBorderColor = Color(0xFF6833FF);
  static const mainBlue = Color(0xFF696FFF);
  static const mainPurple = Color(0xFF6833FF);
  static const background = Color(0xFFF1F1F1);
  static const grey1 = Color(0xFF858585);
  static const white = Color(0xFFFFFFFF);

  static List<Color> avatarColors = [
    Color(0xFFC37575),
    Color(0xFFC39175),
    Color(0xFFC3AE75),
    Color(0xFFBDC375),
    Color(0xFF98C375),
    Color(0xFF75C3A3),
    Color(0xFF75B5C3),
    Color(0xFF7595C3),
    Color(0xFF8575C3),
    Color(0xFFB975C3),
  ];

  static const deleteRed = Color(0xFFFF72B5);
  static const rejectRed = Color(0xFFFF6969);

  static Color get randomAvatar => avatarColors[Random(2425).nextInt(10)];
}
