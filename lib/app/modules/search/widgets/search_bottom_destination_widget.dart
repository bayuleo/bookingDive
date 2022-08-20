import 'package:bookingdive/app/core/base/base_widget_mixin.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/data/model/cities/response_cities_list_countries.dart';
import 'package:bookingdive/app/modules/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBottomDestinationWidget extends StatelessWidget
    with BaseWidgetMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
            color: theme.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 9,
                color: Colors.black.withOpacity(0.2),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 32, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 24, left: 24),
                child: TextBasicWidget(
                  text: 'Choose your destination',
                  size: 18,
                  weight: FontWeight.w500,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 16, bottom: 16, right: 24, left: 24),
                child: TextFormFieldOutlineWidget(
                  hint: 'Search',
                  leftIcon: Icon(Icons.search),
                  controller:
                      controller.destinationBottomInputTextEditingController,
                  onChangedText: (value) =>
                      controller.onChangeSearchTextField(value),
                ),
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: controller.isLoadingSearchDestination
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        padding:
                            const EdgeInsets.only(left: 0, top: 16, right: 0),
                        shrinkWrap: true,
                        itemCount: controller.listCities.length,
                        itemBuilder: (BuildContext context, int index) {
                          final itemRegion = controller.listCities[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: TextBasicWidget(
                                  text:
                                      '${itemRegion.region.toUpperCase()}(${itemRegion.countries.length})',
                                  size: 16,
                                  weight: FontWeight.w700,
                                  color: theme.main70,
                                ),
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: itemRegion.countries.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final itemCountry =
                                        itemRegion.countries[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Divider(),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: InkWell(
                                            onTap: () {
                                              controller
                                                      .selectedDestinationFilter =
                                                  ResponseCitiesListCountries(
                                                      id: itemCountry.id,
                                                      name: itemCountry.name,
                                                      flag: itemCountry.flag,
                                                      cities:
                                                          itemCountry.cities);
                                              controller.searchBy =
                                                  SearchBy.country;
                                              controller
                                                  .destinationTextEditingController
                                                  .text = itemCountry.name;
                                              Get.back();
                                            },
                                            child: Row(
                                              children: [
                                                itemCountry.flag == '' ||
                                                        itemCountry.flag ==
                                                            'null' ||
                                                        itemCountry.flag == null
                                                    ? const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 8),
                                                        child: Icon(Icons
                                                            .flag_outlined),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 8),
                                                        child: Image.network(
                                                          itemCountry.flag,
                                                          width: 16,
                                                          height: 16,
                                                        ),
                                                      ),
                                                TextBasicWidget(
                                                  text: itemCountry.name,
                                                  size: 14,
                                                  weight: FontWeight.w600,
                                                  color: theme.black50,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: itemCountry.cities.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final itemCity =
                                                itemCountry.cities[index];
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Divider(),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 24),
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller
                                                              .selectedDestinationFilter =
                                                          ResponseCitiesListCountries(
                                                        id: itemCountry.id,
                                                        name: itemCountry.name,
                                                        flag: itemCountry.flag,
                                                        cities: [itemCity],
                                                      );
                                                      controller.searchBy =
                                                          SearchBy.city;
                                                      controller
                                                          .destinationTextEditingController
                                                          .text = itemCity.name;
                                                      Get.back();
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 36),
                                                          child:
                                                              TextBasicWidget(
                                                            text: itemCity.name,
                                                            size: 14,
                                                            weight:
                                                                FontWeight.w400,
                                                            color:
                                                                theme.black50,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  }),
                              if ((itemRegion.countries.length) > 0)
                                const Divider(),
                            ],
                          );
                        }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
