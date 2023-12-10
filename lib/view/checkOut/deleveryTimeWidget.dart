import 'package:appwithfirebase/constance.dart';
import 'package:appwithfirebase/core/controller/checkOutController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/enum.dart';
import '../components/customText.dart';

class DeliveryTime extends StatelessWidget {
   DeliveryTime({super.key});



  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      init: Get.put(CheckOutController()),
      builder:(controller)=> Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: controller.delivery,
              onChanged: (Delivery ?value) {
                controller.delivery==value;
              },
              title: CustomText(text: 'Standard Delivery',fontSize: 24,),
              subtitle:CustomText(text: '\nOrder will be delivered between 3-5 business days',) ,
              activeColor: primaryColor,
            ),
            SizedBox(height: 20,),
            RadioListTile<Delivery>(
              value: Delivery.NextDayDelivery,
              groupValue: controller.delivery,
              onChanged: (Delivery ?value) {
                controller.delivery==value;
              },
              title: CustomText(text: 'Next Day Delivery',fontSize: 24,),
              subtitle:CustomText(text: '\nPlace your order before 6pm and your items will be delivered the next day',) ,
              activeColor: primaryColor,
            ),
            SizedBox(height: 20,),
            RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue:  controller.delivery,
              onChanged: (Delivery ?value) {
                controller.delivery==value;
              },
              title: CustomText(text: 'Nominated Delivery',fontSize: 24,),
              subtitle:CustomText(text: '\nPick a particular date from the calendar and order will be delivered on selected date',) ,
              activeColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
