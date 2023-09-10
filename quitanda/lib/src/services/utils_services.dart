import 'package:intl/intl.dart';

class UtilsServices {
  priceToCurrent(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }
}
