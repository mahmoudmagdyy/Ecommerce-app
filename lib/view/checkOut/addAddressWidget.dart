import 'package:appwithfirebase/core/controller/checkOutController.dart';
import 'package:appwithfirebase/view/components/customText.dart';
import 'package:appwithfirebase/view/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      init: CheckOutController(),
      builder:(controller)=> Form(
            key: controller.formState,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
        
              CustomText(text: 'Billing address is the same as delivery address',fontSize: 20,alignment: Alignment.center,),
              SizedBox(height: 40,),
        
              CustomTextFormField(
                onSave: ( value){
                  controller.street1=value;
                },
                validator: ( value){
                  if(value.isEmpty){
                    return 'You Must Write Your Street';
                  }
                },
                text: 'Street 1',
                hint: '21, Alex Davidson Avenue',
              ),
              SizedBox(height: 40,),
        
              CustomTextFormField(
                onSave: ( value){
                  controller.street2=value;
                },
                validator: ( value){
                  if(value.isEmpty){
                    return 'You Must Write Your Street';
                  }
                },
                text: 'Street 2',
                hint: 'Opposite Omegatron, Vicent Quarters',

              ),
              SizedBox(height: 40,),
        
              CustomTextFormField(
                onSave: ( value){
                  controller.city=value;
                },
                validator: ( value){
                  if(value.isEmpty){
                    return 'You Must Write Your City';
                  }
                },
                text: 'City',
                hint: 'Victoria Island',
              ),
              SizedBox(height: 40,),
              Container(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CustomTextFormField(
                          onSave: ( value){
                            controller.state=value;
                          },
                          validator: ( value){
                            if(value.isEmpty){
                              return 'You Must Write Your State';
                            }
                          },
                          text: 'State',
                          hint: 'Lagos State',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CustomTextFormField(
                          onSave: ( value){
                            controller.country=value;
                          },
                          validator: ( value){
                            if(value.isEmpty){
                              return 'You Must Write Your Country';
                            }
                          },
                          text: 'Country',
                          hint: 'Nigeria',
                        ),
                      ),
                    ),
                  ],
                ),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
