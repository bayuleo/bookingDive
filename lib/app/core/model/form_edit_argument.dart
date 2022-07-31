import 'package:bookingdive/app/data/model/index.dart';
import 'package:bookingdive/app/modules/profile/form_edit_profile/form_edit_profile_controller.dart';

class FormEditArgument {
  final String title;
  final String hintTop;
  final String? hintBottom;
  final ResponseProfileData? profileData;
  final InputProfileType inputProfileType;

  FormEditArgument({
    required this.title,
    required this.hintTop,
    this.hintBottom,
    this.profileData,
    required this.inputProfileType,
  });
}
