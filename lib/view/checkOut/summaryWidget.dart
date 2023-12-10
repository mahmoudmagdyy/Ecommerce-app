import 'package:appwithfirebase/constance.dart';
import 'package:appwithfirebase/core/controller/cartController.dart';
import 'package:appwithfirebase/core/controller/checkOutController.dart';
import 'package:appwithfirebase/view/components/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewController>(
        init: CartViewController(),
        builder: (controller) => Column(
          children: [
            Container(
              height: 290,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 20,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  child: Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cardProductModel[index].image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: TextStyle(color: Colors.black),
                            text: controller.cardProductModel[index].name
                                .toString(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text:
                              "\$${controller.cardProductModel[index].price.toString()}",
                          color: primaryColor,
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: controller.cardProductModel.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Shipping Address',
              ),
            ),
            GetBuilder<CheckOutController>(
                init: CheckOutController(),
                builder: (controller) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        fontSize: 24,
                        color: Colors.grey,
                        text:
                            '${controller.street1 + ',' + controller.street2 + ', ' + controller.state + controller.city + ', ' + controller.state + '.'}',
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}
