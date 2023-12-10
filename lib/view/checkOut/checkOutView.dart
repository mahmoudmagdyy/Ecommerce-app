import 'package:appwithfirebase/core/controller/checkOutController.dart';
import 'package:appwithfirebase/view/checkOut/addAddressWidget.dart';
import 'package:appwithfirebase/view/checkOut/deleveryTimeWidget.dart';
import 'package:appwithfirebase/view/checkOut/summaryWidget.dart';
import 'package:appwithfirebase/view/components/customText.dart';
import 'package:appwithfirebase/view/components/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HorizontalExample extends StatelessWidget {


  Widget controlBuilders(context, details) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          CustomButton(
            onPress: details.onStepCancel,
            text: 'Back',
          ),
          const SizedBox(width: 10),
          CustomButton(
            onPress:details.onStepContinue,
            text: 'Next',
          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      init: Get.put(CheckOutController()),
      builder:(controller)=> Scaffold(
        appBar: AppBar(title: CustomText(text: 'CheckOut',fontSize: 25,alignment: Alignment.center,),centerTitle: true,),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Stepper(
            elevation: 0,
            //Horizontal Impact
            // margin: const EdgeInsets.all(20), //vertical impact
            controlsBuilder: controlBuilders,
            type: StepperType.horizontal,
            physics: const ScrollPhysics(),
            onStepTapped: controller.onStepTapped,
            onStepContinue: controller.continueStep,
            onStepCancel: controller.cancelStep,
            currentStep: controller.currentStep,
            //0, 1, 2
            steps: [
              Step(
                  title: const Text('Delivery'),
                  content:DeliveryTime(),
                  isActive: controller.currentStep >= 0,
                  state:
                  controller.currentStep >= 0 ? StepState.complete : StepState.disabled),
              Step(
                title: const Text('Address'),
                content: const AddAddress(),
                isActive: controller.currentStep >= 0,
                state: controller.currentStep >= 1 ? StepState.complete : StepState.disabled,
              ),
              Step(
                title: const Text('Summer'),
                content: const SummaryWidget(),
                isActive: controller.currentStep >= 0,
                state: controller.currentStep >= 2 ? StepState.complete : StepState.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
