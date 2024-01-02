import 'package:smart_home_bl/common_libs.dart';
import 'package:smart_home_bl/model/device_control_item.dart';
import 'package:smart_home_bl/view/add_device_dialog.dart';
import 'package:smart_home_bl/view/pages/devices/devices.dart';
import 'package:smart_home_bl/view/pages/help/help.dart';
import 'package:smart_home_bl/view/pages/history/history.dart';


import '../model/device.dart';
import '../service/db_service.dart';
import 'common/bottom_nav.dart';
import 'common/header.dart';
import 'common/lazy_indexed_stack.dart';
import 'common/measurable_widget.dart';

class PageScaffold extends StatefulWidget with GetItStatefulWidgetMixin {
  PageScaffold({
    Key? key,
    this.initialTabIndex = 0,
  }) : super(key: key);
  final int initialTabIndex;

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold>
    with GetItStateMixin, SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: 3,
    vsync: this,
    initialIndex: widget.initialTabIndex,
  )..addListener(_handleTabChanged);
  AnimationController? _fade;

  final _detailsHasScrolled = ValueNotifier(false);
  double? _tabBarHeight;



  late SqliteService _sqliteService;



  
  @override
  void initState() {
    super.initState();

      this._sqliteService = SqliteService();
    this._sqliteService.initializeDB().whenComplete(() async {
      
    });
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChanged() {
    _fade?.forward(from: 0);
    setState(() {});
  }

  void _handleDetailsScrolled(double scrollPos) =>
      _detailsHasScrolled.value = scrollPos > 0;

  void _handleTabMenuSized(Size size) {
    setState(() => _tabBarHeight = size.height - BottomNavMenu.buttonInset);
  }

    void _saveDevice (Device device) async{
    await _sqliteService.createDevicem(device);
  }

  final titleList = <String>[
    "Devices",
    "History",
    "Help",

  ];


  final colorList = <Color>[
    $styles.colors.darkGray,
    $styles.colors.darkGray,
    $styles.colors.darkGray,
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    int tabIndex = _tabController.index;
    bool showTabBarBg = tabIndex != 1;
    final tabBarHeight = _tabBarHeight ?? 0;

  


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.08),
          child: Header(
            title: titleList[tabIndex],
            iconColor: colorList[tabIndex],
          
            
          )),
            floatingActionButton: Padding(
            padding:  EdgeInsets.only(bottom: screenHeight*0.1, right: screenWidth*0.02),
            child: Container(
              height: screenHeight*0.06,
              width: screenHeight*0.06,
              child: FloatingActionButton(
                child: Icon(Icons.add, color: $styles.colors.darkGray),
                onPressed: () {
                   showDialog(
                                                          context: context,
                                                          
                                                          builder: (_) =>
                                                              AddDeviceDialog(onDeviceConnect:(val) => _saveDevice(val) ,)
                                                      );
                                            
                },
              ),
            ),
          ), 
            floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

      body: Container(
        child: ColoredBox(
          color: Colors.white,
          child: Stack(
            children: [
              LazyIndexedStack(
                index: _tabController.index,
                children: const [
             
                  DevicesPage(),
                  HistoryPage(),
                       HelpPage(),
    
                ],
              ),
              BottomCenter(
                child: ValueListenableBuilder<bool>(
                  valueListenable: _detailsHasScrolled,
                  builder: (_, value, ___) => MeasurableWidget(
                    onChange: _handleTabMenuSized,
                    child: BottomNavMenu(
                      tabController: _tabController,
                      showBg: showTabBarBg,
                      showHomeBtn: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
