import 'package:flutter/material.dart';

class AllRecetsScreen extends StatelessWidget {
  const AllRecetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    const TextStyle titleStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 20, overflow: TextOverflow.ellipsis);
    const TextStyle sectionTitleStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 16, overflow: TextOverflow.ellipsis);
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller : controller,
      child: ConstrainedBox(
        constraints:  BoxConstraints(
          minHeight: size.height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(size: size, titleStyle: titleStyle),
            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 22.0),
              child: Text("Todos los platos disponibles", style: titleStyle),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(0.0),
              itemCount   : 7,
              shrinkWrap  : true,
              controller  : controller,
              itemBuilder : (BuildContext context, int i) {
                return Padding(
                  padding : const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child : GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'recipe', arguments: i),
                    child: Card(
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color : Colors.white,
                      elevation: 0,
                      child : SizedBox(
                        height: 350,
                        child : Padding(
                          padding : const EdgeInsets.all(15.0),
                          child   : SizedBox(
                            // color : Colors.blue,
                            height: double.infinity,
                            width : double.infinity,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment : MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        child: Hero(
                                          tag: i,
                                          child: Image.asset('assets/food/hamburger.png')),
                                      ),
                                      const SizedBox(width: 10.0),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment : MainAxisAlignment.start,
                                          children: [
                                            Text('Titulo del plato', style: sectionTitleStyle),
                                            Text('pequeña descripcion (1 linea)aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', style: TextStyle(color: Colors.black38, fontSize: 14, overflow: TextOverflow.ellipsis), maxLines: 1)
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    
                                    decoration : BoxDecoration(
                                      color : const Color(0xfff6f7fc),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),    
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset('assets/food/hamburgerBanner.jpg')
                                        ),
                                        Positioned(
                                          bottom: 1,
                                          child: Container(
                                            padding : const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                                            height  : 50,
                                            width   : size.width * 0.82,
                                            decoration: const BoxDecoration(
                                              color: Color(0xfff6f7fc),
                                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15.0))
                                            ),
                                            child: const Padding(
                                              padding:EdgeInsets.symmetric(horizontal: 10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  _StadisticsRecipe()
                                                ]
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.size,
    required this.titleStyle,
  });

  final Size size;
  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: size.height * 0.15,
      color : Theme.of(context).primaryColor,
      child : SafeArea(
        child : Align(
          alignment: Alignment.centerLeft,
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Bienvenido a", style: titleStyle.copyWith(color: Colors.white)),
              ),
              Container(
                padding : const EdgeInsets.symmetric(horizontal: 14.0),
                height  : size.height * 0.042,
                child   : Image.asset('assets/platosyplanfondo.png')
              )
            ],
          )
        ),
      )
    );
  }
}



class _StadisticsRecipe extends StatelessWidget {
  const _StadisticsRecipe();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.food_bank_outlined, color: Colors.red[700]),
              const SizedBox(width: 10.0),
              const Text('Italiano', style: TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time_sharp, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              const Text('20 minutos', style: TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
          Row(
            children: [
              Icon(Icons.food_bank, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10.0),
              const Text('facíl', style: TextStyle(fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis), maxLines: 1)
            ],
          ),
        ],
      );
  }
}