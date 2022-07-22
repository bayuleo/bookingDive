import 'package:bookingdive/app/core/base/base_view.dart';
import 'package:bookingdive/app/core/widgets/app_bars/app_bar_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_basic_widget.dart';
import 'package:bookingdive/app/core/widgets/text/text_field_outline_widget.dart';
import 'package:bookingdive/app/modules/main/inbox/inbox_controller.dart';
import 'package:bookingdive/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class InboxScreen extends BaseView<InboxController> {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Message',
        showBackButton: false,
      ),
      body: controller.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 68),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.emptyStateInbox
                        .image(width: MediaQuery.of(context).size.width * 0.4),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 8),
                      child: TextBasicWidget(
                        text: 'No Message Found',
                        weight: FontWeight.w700,
                        size: 18,
                        color: theme.black50,
                      ),
                    ),
                    TextBasicWidget(
                      text:
                          'Message that you send or receive will appear on this page ',
                      size: 16,
                      color: theme.black30,
                      weight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: TextFormFieldOutlineWidget(
                      leftIcon: Transform.scale(
                          scale: 0.5, child: Assets.icons.searchIcon.svg()),
                      hint: 'Search message',
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(
                            top: 16,
                          ),
                          shrinkWrap: true,
                          itemCount: 90,
                          itemBuilder: (BuildContext context, int index) {
                            final widthValue =
                                MediaQuery.of(context).size.width * 0.6;
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child:
                                            Assets.icons.personGreyIcon.svg(),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextBasicWidget(
                                            text: 'Divecenterhost#$index',
                                            size: 14,
                                            color: theme.main50,
                                            weight: FontWeight.w600,
                                          ),
                                          SizedBox(
                                            width: widthValue,
                                            child: TextBasicWidget(
                                              text:
                                                  'Hey John Doe, thank you fo Hey John Doe, thank you fo Hey John Doe, thank you fo',
                                              size: 12,
                                              color: theme.black30,
                                              weight: FontWeight.w400,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: TextBasicWidget(
                                            text: '11:23',
                                            size: 12,
                                            color: theme.black30,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
