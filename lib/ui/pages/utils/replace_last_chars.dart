String hideExceptLastFour(String s) {
  final result = s.replaceAll(RegExp(r'\d(?!\d{0,3}$)'), '*');
  return result;
}
