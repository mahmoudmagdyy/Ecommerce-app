
import 'package:appwithfirebase/core/controller/homePageViewController.dart';
import 'package:appwithfirebase/view/detailsScreenView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/customText.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  List<String> names = <String>[
    'men',
    'women',
    'a',
    'a',
    'a',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<HomePageController>(
      init: Get.put(HomePageController()),
      builder: (controller) =>controller.loading.value? const Center(child: CircularProgressIndicator()):Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              _searchTextFormFeiled(),
              SizedBox(
                height: height * 0.02,
              ),
              CustomText(
                text: 'Category',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              _listViewCategory(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Best Selling",
                    fontSize: 18,
                  ),
                  CustomText(
                    text: "See All",
                    fontSize: 18,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              _listViewProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormFeiled() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomePageController>(
      builder:(controller)=>Container(
        height: 120,
        child: ListView.separated(
          itemCount: controller.categoryModele!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100),
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(controller.categoryModele![index].image .toString()),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: controller.categoryModele![index].name .toString(),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomePageController>(
      builder: (controller)=> SingleChildScrollView(
        child: Container(
          height: 350,
          child: ListView.separated(
            itemCount: controller.productModele!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Get.to(DetailsView(
                    model: controller.productModele![index],
                  ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100),
                        child: Container(
                          height: 230,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.network(
                            controller.productModele![index].image.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: controller.productModele![index].name.toString(),
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: controller.productModele![index].name.toString(),
                        alignment: Alignment.bottomLeft,
                        color: Colors.grey,
                        maxLine: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text:"\$ ${ controller.productModele![index].price}",
                        alignment: Alignment.bottomLeft,
                        color: Colors.teal,
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }
}
