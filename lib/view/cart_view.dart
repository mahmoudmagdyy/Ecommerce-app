import 'package:appwithfirebase/core/controller/cartController.dart';
import 'package:appwithfirebase/constance.dart';
import 'package:appwithfirebase/view/checkOut/checkOutView.dart';
import 'package:appwithfirebase/view/components/customText.dart';
import 'package:appwithfirebase/view/components/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewController>(
        init: Get.put(CartViewController()),
        builder: (controller) => Scaffold(
              body: controller.cardProductModel.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/cartempty.svg",
                          width: 200,
                          height: 200,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: 'Cart Empty',
                          fontSize: 32,
                          alignment: Alignment.topCenter,
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                              itemCount: controller.cardProductModel.length,
                              itemBuilder: (context, index) => Container(
                                height: 140,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 140,
                                        child: Image.network(
                                          controller
                                              .cardProductModel[index].image
                                              .toString(),
                                          fit: BoxFit.fill,
                                        )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: controller
                                                .cardProductModel[index].name
                                                .toString(),
                                            fontSize: 20,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text:
                                                "\$${controller.cardProductModel[index].price.toString()}",
                                            fontSize: 20,
                                            color: primaryColor,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            color: Colors.grey.shade200,
                                            height: 40,
                                            width: 130,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                    child: const Icon(Icons.add,
                                                        color: Colors.black)),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                CustomText(
                                                  text: controller
                                                      .cardProductModel[index]
                                                      .quantity
                                                      .toString(),
                                                  alignment: Alignment.center,
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 15.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .decreaseQuantity(
                                                              index);
                                                    },
                                                    child: const Icon(
                                                      Icons.minimize_outlined,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: 'TOTAL',
                                    fontSize: 22,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GetBuilder<CartViewController>(
                                      init: Get.find(),
                                      builder: (controller) => CustomText(
                                            text: '\$${controller.totalprice}',
                                            color: primaryColor,
                                            fontSize: 18,
                                          ))
                                ],
                              ),
                              Container(
                                height: 100,
                                padding: EdgeInsets.all(20),
                                width: 180,
                                child: CustomButton(
                                  text: 'CHECKOUT',
                                  color: primaryColor,
                                  onPress: () {
                                    Get.to(HorizontalExample());
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
            ));
  }
}
