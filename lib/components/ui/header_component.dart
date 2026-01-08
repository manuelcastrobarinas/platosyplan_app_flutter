import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  
  const HeaderComponent({
    super.key, 
    required this.size,
    required this.titleStyle,
  });

  final Size size;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width : (size.width > 600) ? size.width * 0.35 : double.infinity,
      height: size.height * 0.1,
      child : Align(
        alignment: Alignment.centerLeft,
        child : Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment :  MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(Icons.list, size: 28),
              ),
            ),
            Container(
              width   : (size.width > 600) ? size.width * 0.25 : size.width  * 0.60,
              padding : const EdgeInsets.symmetric(horizontal: 14.0),
              child   : Image.asset('assets/platosyplanfondoNaranja.png', fit: BoxFit.fitWidth)
            ),
            SizedBox(
              height: 35,
              width : 35,
              child : ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child : const FadeInImage( //TODO: REMPLAZAR CON EL USER_IMAGE
                  placeholder:  AssetImage('assets/food/loading-food.gif'), 
                  image : AssetImage('assets/food/hamburgerBanner.jpg'),
                  fit   : BoxFit.cover,
                ),
              ),
            )
          ],
        )
      )
    );
  }
}