import 'package:dollar/exchange_rate/models/lebanon_dollar_rate.dart';
import 'package:dollar/exchange_rate/service/api.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RateController extends GetxController {
  final ExchangeRateService _exchangeRateService = ExchangeRateService();
  final Rxn<LebanonRate?> rate = Rxn<LebanonRate>();
  @override
  void onInit() {
    super.onInit();

    fetchApi();
  }

  Future<void> fetchApi() async {
    rate.value = null;
    rate.value = await _exchangeRateService.getWebsiteData();
    update();
  }
}
