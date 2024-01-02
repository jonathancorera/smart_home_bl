import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/common/app_scroll_behavior.dart';


class AppScaffold extends StatelessWidget  {
  AppScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Theme(
          data: $styles.colors.toThemeData(),
          child: DefaultTextStyle(
            style: $styles.textStyles.bodyText,
            child: ScrollConfiguration(
              behavior: AppScrollBehavior(),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
