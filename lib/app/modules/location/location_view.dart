import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/utils/currency.dart';
import 'package:bookingdive/app/core/widgets/button/button_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/button/button_outline_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/star_rating_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/modules/location/loaction_controller.dart';
import 'package:bookingdive/app/modules/location/widgets/item_review_widget.dart';
import 'package:bookingdive/app/modules/location/widgets/selector_packages_widget.dart';
import 'package:bookingdive/app/modules/search/widgets/selector_search_widget.dart';
import 'package:bookingdive/app/routes/app_routes.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
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

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'KCCs-Nr_LnI',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

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
                              children: const [
                                TextBasicWidget(
                                  text: 'Solomon Islands (UNSET)',
                                  weight: FontWeight.w700,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                TextBasicWidget(
                                  text: '8 September 2021 • 2 divers (UNSET)',
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
                            controller.data?.image ?? '',
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
                            child: Assets.images.loginBanner
                                .image(fit: BoxFit.cover),
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
                                      child: ImageSlideshow(children: [
                                        Assets.images.loginBanner.image(),
                                        Assets.images.loginBanner.image(),
                                        Assets.images.loginBanner.image(),
                                        Assets.images.loginBanner.image(),
                                        Assets.images.loginBanner.image(),
                                      ]),
                                    ),
                                  );
                                }),
                            child: Stack(children: [
                              Container(
                                height: 88,
                                width: double.infinity,
                                child: Assets.images.loginBanner
                                    .image(fit: BoxFit.cover),
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
                        text:
                            'South Male Atoll is a year round destination. Scuba diving in South Male is possible throughout the year, though surface conditions are generally best during the Northeast Monsoon season from late December to May. The Southwest Monsoon runs from June to November and brings with it a greater chance of rain and less calmer seas. Water temperatures at South Male Atoll around 26 to 29C/78 to 84F. Visibility is 15-30m/49-98ft all year round, depending on which side of the atoll you dive in which season.',
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
                          onTap: () => Get.toNamed(Routes.REVIEW),
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
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemReviewWidget();
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
                      child: Assets.images.loginBanner.image(),
                    ),
                    TextBasicWidget(
                      text:
                          'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.',
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
                                -6.175392, 106.827153, 'Monas');
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
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 0, top: 8, right: 0),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ButtonOutlineBasicWidget(
                              text: 'Button1',
                              fontWeight: FontWeight.w400,
                              disableColor: theme.black30,
                              radius: 20,
                              enable: index == 0 ? true : false,
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextBasicWidget(
                        text:
                            'South Male Atoll is a year round destination. Scuba diving in South Male is possible throughout the year, though surface conditions are generally best during the Northeast Monsoon season from late December to May. The Southwest Monsoon runs from June to November and brings with it a greater chance of rain and less calmer seas. Water temperatures at South Male Atoll around 26 to 29C/78 to 84F. Visibility is 15-30m/49-98ft all year round, depending on which side of the atoll you dive in which season.',
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
                      controller: _controller,
                      showVideoProgressIndicator: true,
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
                              text: 'JOHN DOE',
                              size: 14,
                              weight: FontWeight.w600,
                              color: theme.black50,
                            ),
                            TextBasicWidget(
                              text: 'Member since Jan 2022',
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
