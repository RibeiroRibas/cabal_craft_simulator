class FormatTextUtil {
  static String convertToCabalCoin(int itemValue) {
    if (itemValue >= 1000 && itemValue <= 999999 || itemValue <= -1000 && itemValue >= -999999) {
      String alz = itemValue.toString();
      alz = alz.substring(alz.length - 3, null);
      String k = itemValue.toString();
      k = k.replaceRange(k.length - 3, null, "");
      return "$k.$alz K";
    } else if (itemValue >= 1000000 && itemValue <= 999999999 || itemValue <= -1000000 && itemValue >= -999999999) {
      String kk = itemValue.toString();
      kk = kk.replaceRange(kk.length - 6, null, "");
      String k = itemValue.toString();
      k = k.replaceRange(k.length - 3, null, "");
      k = k.substring(k.length - 3, null);
      String alz = itemValue.toString();
      alz = alz.substring(alz.length - 3, null);
      return "$kk.$k.$alz KK";
    } else {
      return "${itemValue.toString()} alz";
    }
  }
}
