class StringUtils {
  StringUtils._();

  static String capitalize(String val) {
    return "${val[0].toUpperCase()}${val.substring(1)}";
  }
}
