
import 'package:smart_home_bl/router.dart';

import '../../common_libs.dart';

class Header extends StatefulWidget {
  const Header(
      {super.key,
      required this.title,
      this.iconColor = Colors.black,
      });

  final String title;
  final Color iconColor;


  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      elevation: 0,
      title: Container(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          widget.title,
          style:
              $styles.textStyles.headerText.copyWith(color: widget.iconColor),
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: [
     
       
        TweenAnimationBuilder<double>(
            duration: $styles.times.fast,
            tween: Tween(begin: 0, end: 1),
            child: AnimatedContainer(
              curve: Curves.linear,
              duration: $styles.times.fast,
              padding: EdgeInsets.only(right: screenWidth * 0.06),
              child: GestureDetector(
                  onTap: () {
                   GoRouter.of(context).go(ScreenPaths.settings);
                  },
                  child: Icon(Icons.settings, color: widget.iconColor)),
            ),
            builder: (_, value, child) {
              final curvedValue = Curves.linear.transform(value);
              return Transform.scale(
                scale: .5 + .5 * curvedValue,
                child: Transform.translate(
                  offset: Offset(0, -100 * (1 - curvedValue)),
                  child: AnimatedOpacity(
                    opacity: 1,
                    duration: $styles.times.slow,
                    child: child!,
                  ),
                ),
              );
            }),
      ],
    );
  }
}
