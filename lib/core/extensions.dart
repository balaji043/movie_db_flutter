extension DateTimeExtension on DateTime {
  String get paddedString =>
      '${_pad(year, 4)}-${_pad(month, 2)}-${_pad(day, 2)}';

  String _pad(int i, int width) => i.toString().padLeft(width, '0');
}
