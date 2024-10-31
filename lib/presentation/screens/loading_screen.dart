import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            color: Colors.red,
            child: const Stack(
              children: [
                // Image.asset('name')
              ],
            ),
          )
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment : MainAxisAlignment.center,
              children: [
                Text('Track your Confort', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), maxLines: 2),
                Text('food here', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), maxLines: 2),
                SizedBox(height: 10.0),
                Text('Here You Can find a chef or dish for every taste and color. Enjoy!', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12), textAlign: TextAlign.center, maxLines: 2)
              ],
            ),
          )
        ),
        Flexible(
          flex: 2,
          child: Center(
            child: MaterialButton(
              minWidth  : MediaQuery.of(context).size.width * 0.55,
              elevation : 0,
              height: 50,
              color : Colors.orange,
              shape : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: () {},
              child : const Text('Siguiente', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis, fontSize: 17), maxLines: 1),
            ),
          )
        ),
      ],
    );
  }
}
