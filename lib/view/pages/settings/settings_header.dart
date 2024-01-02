import 'package:smart_home_bl/common_libs.dart';

import '../../../router.dart';

class SettingsHeader extends StatefulWidget {
  const SettingsHeader({super.key, required this.title, this.iconColor = Colors.black});

  final String title;
  final Color iconColor;

  @override
  State<SettingsHeader> createState() => _SettingsHeaderState();
}

class _SettingsHeaderState extends State<SettingsHeader> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
        
        elevation: 0,
        title: Text(widget.title,
            style: $styles.textStyles.headerText.copyWith(color: widget.iconColor), textScaleFactor: MediaQuery.of(context).textScaleFactor,
                ),
        backgroundColor: Colors.transparent,
        leading:  
                 Container(padding: const EdgeInsets.only(left:20), child: IconButton(icon: const Icon(Icons.arrow_back), color: widget.iconColor, onPressed: () {
                 
                  GoRouter.of(context).go(ScreenPaths.home);
                   
                 },)),
              
           
        actions: [
        
              TweenAnimationBuilder<double>(
              duration: $styles.times.fast,
              tween: Tween(begin: 0, end: 1),
              child: AnimatedContainer(
                curve: Curves.linear,
                duration: $styles.times.fast,
                padding: EdgeInsets.only(right: screenWidth * 0.08),
                child: GestureDetector(
                onTap: () async {
                  debugPrint("logout");
                  await logout(context);
                
                 
                },
                child: Icon(Icons.logout, color: widget.iconColor)),
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

  logout(BuildContext context) async {
      GoRouter.of(context).go(ScreenPaths.landing);
  }