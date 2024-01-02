import 'package:smart_home_bl/common_libs.dart';

class CustomElevatedButton extends StatefulWidget {
  CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.hasTrailingIcon = false});

  final Function onPressed;
  final String label;
  bool hasTrailingIcon;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
        onPressed: () async {
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          
          padding:  (widget.hasTrailingIcon) ? EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.1,
          )
          :const EdgeInsets.all(
            0
            
          
          ),
          backgroundColor: $styles.colors.accent,
          foregroundColor: $styles.colors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          alignment: (widget.hasTrailingIcon) ? Alignment.centerRight : Alignment.center,
        ),
        child: 
        
        (widget.hasTrailingIcon) ? Row(
          children: [
            Text(
              widget.label,
              style: $styles.textStyles.buttonText,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
            ),
            
              Container(
                  padding: EdgeInsets.only(left: screenWidth * 0.1),
                  child: const Icon(Icons.chevron_right))
          ],
        )
        :Text(
              widget.label,
              style: $styles.textStyles.buttonText,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
            ),);
  }
}
