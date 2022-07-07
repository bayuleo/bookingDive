import '../../../../gen/assets.gen.dart';

class BottomNavItem {
  final SvgGenImage icon;
  final SvgGenImage activeIcon;
  // final PermissionResource? resource;
  // final UserRoleACL? roleACL;
  final String label;

  BottomNavItem({
    required this.icon,
    required this.label,
    required this.activeIcon,
    // this.resource,
    // this.roleACL,
  });
}
