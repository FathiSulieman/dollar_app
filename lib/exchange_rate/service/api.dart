import 'package:dollar/exchange_rate/models/lebanon_dollar_rate.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class ExchangeRateService {
  Future<LebanonRate> getWebsiteData() async {
    final urlPrefix = "https://cors-anywhere.herokuapp.com/";
    final url = Uri.parse("${kIsWeb ? urlPrefix : ""}https://lbprate.com/");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
    final buyRateAndSell =
        html.querySelectorAll('h4 > span').map((e) => e.innerHtml).toList();
    final lastUpdated = html
        .querySelectorAll("nav > div > label ")
        .map((e) => e.innerHtml)
        .toList();
    return LebanonRate.fromJson({
      "buyRate": buyRateAndSell[1],
      "sellRate": buyRateAndSell[3],
      "updatedDate": lastUpdated.join(' '),
    });
  }
}
