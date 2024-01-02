import '../../../assets.dart';
import '../../../common_libs.dart';
import 'settings_header.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final fieldList = [];

  String candidateBand = "Not Available";
  String candidateRole = "Not Available";

  List<String> candidateSpecialities = [];
  List<String> preferredClients = [];
  List<String> likeWards = [];

  _SettingsPageState() {}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenHeight);
    return Scaffold(
        backgroundColor: $styles.colors.darkGray,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.08),
            child: SettingsHeader(
              title: "Settings",
              iconColor: $styles.colors.offWhite,
            )),
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            collapsedHeight: screenHeight * 0.3,
            expandedHeight: screenHeight * 0.3,
            backgroundColor: $styles.colors.darkGray,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  top: screenHeight * 0.11,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.16,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child:
                                  Image.asset(ImagePaths.profilePicPlaceholder),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: screenHeight * 0.05),
                            child: Text(
                              "John Doe",
                              style: $styles.textStyles.subheaderText
                                  .copyWith(color: $styles.colors.offWhite),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.02, left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    
                            Divider(
                color: $styles.colors.accent,
                indent: screenWidth * 0.1,
                endIndent: screenWidth * 0.1,
                thickness: 3,
              ),
                           

                            Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01)),
                  Container(
                    color: $styles.colors.offWhite,
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.1),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text("Address",
                                  style: $styles.textStyles.bodyText
                                      .copyWith(fontWeight: FontWeight.bold)),
                            )),
                        Expanded(
                            flex: 6,
                            child: Container(
                              child: Text(
                                "123, Main Street, Capital City",
                                style: $styles.textStyles.bodyText,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02)),

                          Container(
                    color: $styles.colors.offWhite,
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.1),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text("Phone",
                                  style: $styles.textStyles.bodyText
                                      .copyWith(fontWeight: FontWeight.bold)),
                            )),
                        Expanded(
                            flex: 6,
                            child: Container(
                              child: Text(
                                "077 4805696",
                                style: $styles.textStyles.bodyText,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02)),

                          Container(
                    color: $styles.colors.offWhite,
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.1),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Text("Home Name",
                                  style: $styles.textStyles.bodyText
                                      .copyWith(fontWeight: FontWeight.bold)),
                            )),
                        Expanded(
                            flex: 6,
                            child: Container(
                              child: Text(
                                "Test Home",
                                style: $styles.textStyles.bodyText,
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}

class ProfileListItem {
  const ProfileListItem(this.itemLabel, this.itemValue, this.itemIcon);

  final String itemLabel;
  final String itemValue;
  final Icon itemIcon;
}

class HorizontalButtonContainer extends StatelessWidget {
  HorizontalButtonContainer({super.key, required this.itemList});

  List<String> itemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Wrap(
        runSpacing: MediaQuery.of(context).size.height * 0.01,
        children: [
          for (int i = 0; i < itemList.length; i++)
            Container(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 38, 44, 38),
                          const Color.fromARGB(255, 11, 78, 13)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      border:
                          Border.all(color: $styles.colors.offWhite, width: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    itemList[i],
                    style: $styles.textStyles.cardHeaderText
                        .copyWith(color: $styles.colors.offWhite),
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                  )),
            )
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    double Height = size.height;
    double width = size.width;

    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
