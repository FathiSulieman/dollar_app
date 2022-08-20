import 'package:dollar/controllers/rate_screen_controller.dart';
import 'package:dollar/drawer/screens/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

class LebanonRateWidget extends StatelessWidget {
  const LebanonRateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RateController controller = Get.put(RateController());
    return ThemeSwitchingArea(
      key: key,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          // title: const Text(
          //   "Dollar Today",
          //   style: TextStyle(fontSize: 15),
          // ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Obx(() => Text(
                    controller.rate.value != null
                        ? controller.rate.value!.lastUpdatedRate.toString()
                        : "",
                    style: const TextStyle(fontSize: 15),
                  )),
            ),
            IconButton(
                onPressed: () async {
                  await controller.fetchApi();
                },
                icon: const Icon(
                  Icons.replay_outlined,
                ))
          ],
        ),
        body: GetBuilder<RateController>(builder: (_) {
          if (_.rate.value != null) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(22, 20, 0, 0),
                  child: Text(
                      "The following prices differ from one exchanger to another by 100 - 200 LBP"),
                ),
                rateWidget("Sell", controller.rate.value!.sellRate.toString()),
                rateWidget("Buy", controller.rate.value!.buyRate.toString()),
                
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
        drawer: const MainDrawer(),
      ),
    );
  }

  Padding rateWidget(String exchange, String rate) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 0, 20),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/money_bag.svg',
            height: 50,
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 9),
                  child: Text("$exchange Rate"),
                ),
                Text(rate),
              ],
            ),
          )
        ],
      ),
    );
  }
}
