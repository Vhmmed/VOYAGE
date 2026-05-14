import 'package:flutter/material.dart';

class AppTheme {
  // الألوان الأساسية (الموجودة سابقاً)
  static const Color primaryBlue = Color(0xFF1E3A8A); // أزرق ملكي
  static const Color brightBlue = Color(0xFF3B82F6); // أزرق زاهي
  static const Color lightBlue = Color(0xFF60A5FA); // أزرق فاتح
  static const Color greyBg = Color(0xFFF3F4F6);
  static const Color greyText = Color(0xFF9CA3AF);
  static const Color white = Color(0xFFFFFFFF);

  // إضافة ألوان جديدة للـ Home
  static const Color darkText = Color(0xFF111827); // أسود للنصوص العريضة
  static const Color purpleAccent =
      Color(0xFF8B5CF6); // بنفسجي فاتح (لعنوان CURATED COLLECTIONS)
  static const Color overlayDark = Color(0xCC000000); // تدرج أسود شفاف للصور

  // التدرج الخلفي (موجود)
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFEF2F2), Color(0xFFF0FDFA), Color(0xFFFFFFFF)],
  );

  // الظلال
  static List<BoxShadow> get cardShadow => [
        BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10)),
      ];
  static List<BoxShadow> get buttonShadow => [
        BoxShadow(
            color: brightBlue.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6)),
      ];

}
