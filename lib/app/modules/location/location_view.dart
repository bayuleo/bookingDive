import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/utils/argument.dart';
import 'package:bookingdive/app/core/utils/currency.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/star_rating_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/location/loaction_controller.dart';
import 'package:bookingdive/app/modules/location/widgets/item_review_widget.dart';
import 'package:bookingdive/app/modules/location/widgets/selector_packages_widget.dart';
import 'package:bookingdive/app/modules/location/widgets/selector_search_widget.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LocationScreen extends BaseView<LocationController> {
  LocationScreen({Key? key}) : super(key: key);

  final List<String> exampleList = [
    'title 1',
    'title 2',
    'title 3',
    'title 4',
    'title 5'
  ];

  final imagesWidget = <Widget>[];

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: theme.main70),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 60, bottom: 20, left: 26, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Assets.icons.downStrokeIcon.svg(color: Colors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBasicWidget(
                                  text: controller.searchDetailArguments
                                          ?.locationName ??
                                      '',
                                  weight: FontWeight.w700,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                TextBasicWidget(
                                  text:
                                      '${controller.searchDetailArguments?.date} • ${controller.searchDetailArguments?.diver} divers',
                                  weight: FontWeight.w400,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      ButtonBasicWidget(
                        text: 'Change',
                        onTap: () => showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (_) {
                            return SelectorSearchWidget();
                          },
                        ),
                        backgroundColor: theme.main10,
                        textColor: theme.main50,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Flexible(
                      flex: 16,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Image.network(
                            controller.data?.images?.first ?? '',
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ),
                      )),
                  Flexible(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Container(
                            height: 88,
                            width: double.infinity,
                            child: Image.network(
                              controller.data?.images?[1] ?? '',
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.zero,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    content: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent),
                                      child: ImageSlideshow(
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  (controller.data?.images
                                                          ?.length ??
                                                      0);
                                              i++)
                                            Image.network(
                                              controller.data?.images?[i] ?? '',
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            child: Stack(children: [
                              Container(
                                height: 88,
                                width: double.infinity,
                                child: Image.network(
                                  controller.data?.images?[2] ?? '',
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 88,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6)),
                                child: Center(
                                  child: TextBasicWidget(
                                    text: '+8 Others',
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBasicWidget(
                      text: controller.data?.productName ?? 'Product Name',
                      size: 16,
                      weight: FontWeight.w700,
                      color: theme.black70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: TextBasicWidget(
                              text:
                                  '${controller.data?.locationState ?? 'State'}, ${controller.data?.locationCountry ?? 'Country'}',
                              size: 14,
                              weight: FontWeight.w400,
                              color: theme.black30,
                            ),
                          ),
                          StarRatingWidget(
                              rating: controller.data?.ratingResult ?? 0),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: TextBasicWidget(
                              text: '(${controller.data?.ratingCount ?? 0})',
                              size: 12,
                              weight: FontWeight.w400,
                              color: theme.black30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    (controller.data?.isWishlist ?? false)
                        ? Assets.icons.heartRedIcon.svg(color: theme.error50)
                        : Assets.icons.heartGreyIcon.svg(),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: theme.disable,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 16, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextBasicWidget(
                        text: 'Overview',
                        size: 14,
                        weight: FontWeight.w600,
                        color: theme.black70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TextBasicWidget(
                        size: 14,
                        weight: FontWeight.w400,
                        color: theme.black50,
                        text: 'Not Set',
                      ),
                    ),
                    for (var i in exampleList)
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Assets.icons.checkboxGreenIcon.svg(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: TextBasicWidget(
                              text: i,
                              size: 14,
                              weight: FontWeight.w400,
                              color: theme.black50,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: theme.disable,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextBasicWidget(
                                text: 'Review',
                                size: 14,
                                weight: FontWeight.w600,
                                color: theme.black70,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                TextBasicWidget(
                                  text: '${controller.data?.ratingResult ?? 0}',
                                  size: 16,
                                  weight: FontWeight.w700,
                                  color: theme.black70,
                                ),
                              ],
                            ),
                            TextBasicWidget(
                              text:
                                  'Dari ${controller.data?.ratingCount} review${(controller.data?.ratingCount ?? 0) > 1 ? 's' : ''}',
                              size: 12,
                              weight: FontWeight.w400,
                              color: theme.black30,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(
                            Routes.REVIEW,
                            arguments: ReviewArguments(
                                locationName:
                                    controller.data?.productName ?? '',
                                rating: controller.data?.ratingResult ?? 0,
                                totalReview: controller.data?.ratingCount ?? 0,
                                id: controller.searchDetailArguments!.id),
                          ),
                          child: TextBasicWidget(
                            text: 'See All',
                            textDecoration: TextDecoration.underline,
                            size: 16,
                            weight: FontWeight.w700,
                            color: theme.main50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 220,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 0, top: 16, right: 0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listReview.length,
                        itemBuilder: (BuildContext context, int index) {
                          var item = controller.listReview[index];
                          return ItemReviewWidget(
                            data: item,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: theme.disable,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBasicWidget(
                      text: 'Location',
                      size: 14,
                      weight: FontWeight.w600,
                      color: theme.black70,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      // child: Assets.images.loginBanner.image(),
                      child: SizedBox(
                        width: double.infinity,
                        height: 124,
                        child: FlutterMap(
                          options: MapOptions(
                            center: LatLng(
                              double.parse(controller.data?.lat ?? '0'),
                              double.parse(controller.data?.lng ?? '0'),
                            ),
                            zoom: 10,
                          ),
                          layers: [
                            TileLayerOptions(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayerOptions(
                              markers: [
                                Marker(
                                  point: LatLng(
                                    double.parse(controller.data?.lat ?? '0'),
                                    double.parse(controller.data?.lng ?? '0'),
                                  ),
                                  width: 80,
                                  height: 80,
                                  builder: (context) {
                                    return Assets.images.marker.image();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextBasicWidget(
                      text: controller.data?.formattedLocation ?? '',
                      size: 14,
                      weight: FontWeight.w400,
                      color: theme.black30,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: InkWell(
                          onTap: () {
                            MapsLauncher.launchCoordinates(
                                // -6.175392, 106.827153, 'Monas');
                                double.parse(controller.data?.lat ?? '0'),
                                double.parse(controller.data?.lng ?? '0'),
                                controller.data?.productName ?? 'location');
                          },
                          child: TextBasicWidget(
                            text: 'See Map',
                            size: 16,
                            weight: FontWeight.w700,
                            color: theme.main50,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: theme.disable,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBasicWidget(
                      text: 'Description',
                      size: 14,
                      weight: FontWeight.w600,
                      color: theme.black70,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ListView(
                        padding: EdgeInsets.only(left: 0, top: 8, right: 0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ButtonOutlineBasicWidget(
                              text: 'About Place',
                              fontWeight: FontWeight.w400,
                              disableColor: theme.black30,
                              radius: 20,
                              enable: controller.selectedDescription == 0,
                              forceOnTap: true,
                              onTap: () {
                                controller.onChangeDescription(0);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ButtonOutlineBasicWidget(
                              text: 'Refund Policy',
                              fontWeight: FontWeight.w400,
                              disableColor: theme.black30,
                              radius: 20,
                              enable: controller.selectedDescription == 1,
                              forceOnTap: true,
                              onTap: () {
                                controller.onChangeDescription(1);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ButtonOutlineBasicWidget(
                              text: 'Neighborhood',
                              fontWeight: FontWeight.w400,
                              disableColor: theme.black30,
                              radius: 20,
                              enable: controller.selectedDescription == 2,
                              forceOnTap: true,
                              onTap: () {
                                controller.onChangeDescription(2);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ButtonOutlineBasicWidget(
                              text: 'Interaction',
                              fontWeight: FontWeight.w400,
                              disableColor: theme.black30,
                              radius: 20,
                              enable: controller.selectedDescription == 3,
                              forceOnTap: true,
                              onTap: () {
                                controller.onChangeDescription(3);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ButtonOutlineBasicWidget(
                              text: 'Other',
                              fontWeight: FontWeight.w400,
                              disableColor: theme.black30,
                              radius: 20,
                              enable: controller.selectedDescription == 4,
                              forceOnTap: true,
                              onTap: () {
                                controller.onChangeDescription(4);
                              },
                            ),
                          ),
                        ],
                        // itemCount: 9,
                        // itemBuilder: (BuildContext context, int index) {
                        //   return Padding(
                        //     padding: const EdgeInsets.only(right: 8),
                        //     child: ButtonOutlineBasicWidget(
                        //       text: 'Button1',
                        //       fontWeight: FontWeight.w400,
                        //       disableColor: theme.black30,
                        //       radius: 20,
                        //       enable: index == 0 ? true : false,
                        //       onTap: () {},
                        //     ),
                        //   );
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextBasicWidget(
                        text: controller.selectedDescription == 0
                            ? controller.data?.description.about ?? ''
                            : controller.selectedDescription == 1
                                ? controller.data?.description.refund ?? ''
                                : controller.selectedDescription == 2
                                    ? controller
                                            .data?.description.neighborhood ??
                                        ''
                                    : controller.selectedDescription == 3
                                        ? controller.data?.description
                                                .interaction ??
                                            ''
                                        : controller.data?.description.other ??
                                            '',
                        size: 14,
                        weight: FontWeight.w400,
                        color: theme.black50,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: theme.disable,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextBasicWidget(
                        text: 'Media',
                        size: 14,
                        weight: FontWeight.w600,
                        color: theme.black70,
                      ),
                    ),
                    YoutubePlayer(
                      controller: controller.youtubePlayerController,
                      showVideoProgressIndicator: true,
                      onReady: () {
                        controller.getDetailLocation();
                        controller.getReview();
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: theme.disable,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 12, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextBasicWidget(
                        text: 'Host Contact',
                        size: 14,
                        weight: FontWeight.w600,
                        color: theme.black70,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Assets.icons.personGreyIcon.svg(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBasicWidget(
                              text: controller.data?.hostname ?? '',
                              size: 14,
                              weight: FontWeight.w600,
                              color: theme.black50,
                            ),
                            TextBasicWidget(
                              text:
                                  'Member since ${controller.data?.hostSince ?? ''}',
                              size: 12,
                              weight: FontWeight.w400,
                              color: theme.black30,
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ButtonOutlineBasicWidget(
                        text: 'Message Host',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: theme.disable,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 16),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextBasicWidget(
                      text: 'starts from ',
                      size: 14,
                      weight: FontWeight.w400,
                      color: theme.black30,
                    ),
                    TextBasicWidget(
                      text:
                          '${controller.data?.priceCurrency ?? ''} ${controller.data?.priceLower.addComma() ?? 0}',
                      size: 14,
                      weight: FontWeight.w600,
                      color: theme.error50,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ButtonBasicWidget(
                    text: 'See All Packages',
                    isFullWidht: true,
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) {
                          return SelectorPackagesWidget();
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
