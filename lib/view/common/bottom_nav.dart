import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/router.dart';

import '../control/buttons.dart';
import '../control/circle_buttons.dart';

class BottomNavMenu extends StatelessWidget {
  static double bottomPadding = 0;
  static double buttonInset = 12;

  const BottomNavMenu(
      {Key? key, required this.tabController, this.showBg = false,  required this.showHomeBtn})
      : super(key: key);

  final TabController tabController;
  final bool showBg;
  final bool showHomeBtn;
  

  @override
  Widget build(BuildContext context) {
    Color iconColor = showBg ? $styles.colors.darkGray : $styles.colors.offWhite;
    const double homeBtnSize =70;
    // Use SafeArea padding if its more than the default padding.
    bottomPadding = max(context.mq.padding.bottom, $styles.insets.xs * 1);
    return Stack(
      children: [
        //Background
        Positioned.fill(
          child: AnimatedOpacity(
            duration: $styles.times.fast,
            opacity: showBg ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ColoredBox(color: $styles.colors.darkGray),
            ),
          ),
        ),
        // Buttons
        Padding(
          padding: EdgeInsets.only(left: $styles.insets.sm, right: $styles.insets.xxs, bottom: bottomPadding),
    
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Holds a gap for the Home button which pushed the other icons to the side
                  AnimatedContainer(
                    curve: Curves.easeOut,
                    duration: $styles.times.med,
                    width: showHomeBtn ? homeBtnSize : 0,
                    height: 0,
                  ),
                  _TabBtn(0, tabController, 
                      iconImg: '0xe37b', label: "devices", showBg: showBg,),
                  _TabBtn(1, tabController,
                      iconImg: '0xf582', label:"history", showBg: showBg,),
                  _TabBtn(2, tabController,
                      iconImg: '0xf16e', label: "help", showBg: showBg,),
                
                ],
              ),

              // Home btn
              TweenAnimationBuilder<double>(
                duration: $styles.times.fast,
                tween: Tween(begin: 0, end: showHomeBtn ? 1 : 0),
                child: _HomeBtn(
                  size: homeBtnSize,
                  borderSize: showBg ? 6 : 2,
                  showBg: showBg,
                ),
                builder: (_, value, child) {
                  final curvedValue = Curves.easeOut.transform(value);
                  return Transform.scale(
                    scale: .5 + .5 * curvedValue,
                    child: Transform.translate(
                      offset: Offset(0, 100 * (1 - curvedValue)),
                      child: AnimatedOpacity(
                        opacity: showHomeBtn ? 1 : 0,
                        duration: $styles.times.med,
                        child: child!,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HomeBtn extends StatelessWidget {
  const _HomeBtn({Key? key, required this.size, required this.borderSize, required this.showBg})
      : super(key: key);

  final double size;
  final double borderSize;
  final bool showBg;

  @override
  Widget build(BuildContext context) {
    return CircleBtn(
      onPressed: () => {
        print("button pressed"),
        GoRouter.of(context).go(ScreenPaths.home, extra: 1)
      },
      bgColor: showBg ? $styles.colors.darkGray : Colors.transparent,
      semanticLabel: "home",
      child: AnimatedContainer(
        curve: Curves.easeOut,
        duration: $styles.times.fast,
        width: size - borderSize * 2,
        height: size - borderSize * 2,
        margin: EdgeInsets.all(borderSize),
    
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: showBg ? $styles.colors.accent : $styles.colors.darkGray, width: 2),
          color:  showBg ?  $styles.colors.darkGray : Colors.transparent,
       
       
          //image: const DecorationImage(image: AssetImage('assets/images/logo-letter.png'), fit: BoxFit.scaleDown),
          
        ),
        child:  Icon(showBg ? Icons.home_rounded : Icons.home_outlined, size: 35, color: $styles.colors.accent,),
      ),
    );
  }
}

class _TabBtn extends StatelessWidget {
  const _TabBtn(
    this.index,
    this.tabController, {
    Key? key,
    required this.iconImg,
    required this.label,
    required this.showBg,
  }) : super(key: key);

  final int index;
  final TabController tabController;
  final String iconImg;
  final String label;
  final bool showBg;

  @override
  Widget build(BuildContext context) {
    bool selected = tabController.index == index;

    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    String tabLabel = localizations.tabLabel(tabIndex: index + 1, tabCount: tabController.length);
    tabLabel = '$label: $tabLabel';
    return Expanded(
      child: MergeSemantics(
        child: Semantics(
          selected: selected,
          label: tabLabel,
          child: ExcludeSemantics(
            child: AppBtn.basic(
              padding: EdgeInsets.only(top: $styles.insets.md + $styles.insets.xs, bottom: $styles.insets.sm),
              onPressed: () => tabController.index = index,
              semanticLabel: label,
              child: Stack(
                children: [
                  /// Image icon
                 // Image.asset(iconImgPath, height: 32, width: 32, color: selected ? null : color),
                 
                       Icon(IconData(int.parse(iconImg), fontFamily: 'MaterialIcons'),
                        
      color:selected ?  $styles.colors.accent :  showBg ? $styles.colors.offWhite : $styles.colors.darkGray,
      size: 24.0,
    ),

                  if (selected)
                    Positioned.fill(
                      child: BottomCenter(
                        child: Transform.translate(
                          offset: Offset(0, $styles.insets.xs),
                          child: Animate().custom(
                            curve: Curves.easeInOut,
                            end: 24,
                            builder: (_, v, __) => Container(height: 4, width: v, color: $styles.colors.accent),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
