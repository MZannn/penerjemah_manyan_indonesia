import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: controller.isIndonesian.value
                          ? Colors.black
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Indonesia",
                      style: TextStyle(
                        color: controller.isIndonesian.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.changeLanguage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(
                    Icons.compare_arrows_rounded,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                Obx(
                  () => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: controller.isIndonesian.value
                          ? Colors.transparent
                          : Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Maanyan",
                      style: TextStyle(
                        color: controller.isIndonesian.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Obx(
                () => TextField(
                  controller: controller.textController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    hintText: controller.isIndonesian.value
                        ? "Masukkan Teks"
                        : "Nampasuk Teks",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.translateToManyan(controller.textController.text);
              },
              child: const Text("Terjemahkan"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: TextField(
                controller: controller.translateController,
                readOnly: true,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    hintText: "Terjemahan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
