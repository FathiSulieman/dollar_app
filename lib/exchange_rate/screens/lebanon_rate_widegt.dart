import 'package:dollar/exchange_rate/models/lebanon_dollar_rate.dart';
import 'package:dollar/exchange_rate/service/api.dart';
import 'package:dollar/extensions.dart';
import 'package:flutter/material.dart';

class LebanonRateWidget extends StatefulWidget {
  const LebanonRateWidget({Key? key}) : super(key: key);

  @override
  State<LebanonRateWidget> createState() => _LebanonRateWidgetState();
}

class _LebanonRateWidgetState extends State<LebanonRateWidget> {
  @override
  void initState() {
    super.initState();
    fetchApi();
  }

  Future<void> fetchApi() async {
    _rate = await _exchangeRateService.getWebsiteData();
    setState(() {});
  }

  final ExchangeRateService _exchangeRateService = ExchangeRateService();
  LebanonRate _rate = LebanonRate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Dollar Today",
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: HexColor.fromHex('#343a40'),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: Text(
              _rate.lastUpdatedRate.toString(),
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          IconButton(
              onPressed: () async {
                await fetchApi();
              },
              icon: const Icon(
                Icons.replay_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
              color: HexColor.fromHex("#007bff"),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const Text(
                      "USD to LBP Exchange Rate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Buy ${_rate.buyRate}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sell ${_rate.sellRate}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
