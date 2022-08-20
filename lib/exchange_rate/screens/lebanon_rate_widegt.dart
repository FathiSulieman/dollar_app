import 'package:dollar/controllers/rate_screen_controller.dart';
import 'package:dollar/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LebanonRateWidget extends StatelessWidget {
  const LebanonRateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RateController controller = Get.put(RateController());
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
            child: Obx(() => Text(
                  controller.rate.value != null
                      ? controller.rate.value!.lastUpdatedRate.toString()
                      : "",
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                )),
          ),
          IconButton(
              onPressed: () async {
                await controller.fetchApi();
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
              child: GetBuilder<RateController>(builder: (_) {
                if (_.rate.value != null) {
                  return Padding(
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
                                  'Buy ${controller.rate.value!.buyRate}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Sell ${controller.rate.value!.sellRate}',
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
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.green,
                  ));
                }
              })),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: MaterialButton(onPressed: () => {}, child: const Text("")),
            ),
          ),
        ],
      ),
    );
  }
}
