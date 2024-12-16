import 'package:flutter/material.dart';
import '../../../../components/components.dart';

class FiveSelectedUtensilsScreen extends StatefulWidget {
  const FiveSelectedUtensilsScreen({super.key});

  @override
  State<FiveSelectedUtensilsScreen> createState() => _FiveSelectedUtensilsScreenState();
}

class _FiveSelectedUtensilsScreenState extends State<FiveSelectedUtensilsScreen> {
  final TextEditingController _utensilController = TextEditingController();
  List<String> selectedUtensils = [];
  bool get _isFormValid => _utensilController.text.isEmpty;

  @override
  void initState() {
    super.initState();
    _utensilController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _utensilController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<bool> stepsStatus = [true, true, true, true, true, false, false];

    return SizedBox(
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 60,
              child: TimelineVerticalComponent(
                stepsStatus: stepsStatus, 
                heightToSpaceToNodes: size.height * 0.11
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 35.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Utensilios', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                            const SizedBox(height: 10.0),
                            const Text('Agrega los utensilios que usaste para crear tu receta: Ejemplo: Sarten, Cuchillo, etc.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400), textAlign: TextAlign.justify),
                            const SizedBox(height: 10.0),
                
                            TextformfieldComponent(
                              icon      : Icons.soup_kitchen_outlined,  
                              controller: _utensilController,
                              keyboardType: TextInputType.text,
                              label     : "Utensilio",
                            ),
                            const SizedBox(height: 10.0),
                            ButtonComponent(
                              backgroundColor: Theme.of(context).primaryColor,
                              minHeight : 45,
                              isLoading : false,
                              minWidth  : double.infinity,
                              text      : 'Agregar utensilio',
                              function  : _isFormValid ? null : () {
                                if (_utensilController.text.isNotEmpty) {
                                  final bool utensilExist = selectedUtensils.any((String utensil) => utensil.toLowerCase() == _utensilController.text.toLowerCase());
                                  if (utensilExist) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                        content: const Text('Este utensilio ya fue agregado'),
                                        backgroundColor: Theme.of(context).secondaryHeaderColor,
                                      ),
                                    );
                                    return;
                                  }
                                  setState(() {
                                    selectedUtensils.add(_utensilController.text);
                                    _utensilController.clear();
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Divider(color: Colors.grey.shade300,),
                      const SizedBox(height: 20.0),
                      Divider(color: Colors.grey.shade300,),
                      const SizedBox(height: 10.0), 
                      const Text('Utensilios Seleccionados', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 10.0),
                      (selectedUtensils.isEmpty) 
                      ? ListTile(
                          shape   : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300),),
                          subtitle: const Text('No tienes utensilios seleccionados. tienes que agregar utensilios para crear tu receta.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),textAlign: TextAlign.justify),
                          trailing: const SizedBox(),
                        ) 
                      : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selectedUtensils.length,
                        itemBuilder: (context, index) {
                          final utensil = selectedUtensils[index];
                          return ListTile(
                            shape   : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: Colors.grey.shade300)),
                            title   : Text(utensil),
                            trailing: IconButton(
                              icon:  Icon(Icons.delete, color: Theme.of(context).primaryColor),
                              onPressed: () => setState(() => selectedUtensils.removeAt(index)),
                            ),
                          );
                        },
                      ),
                      
                      const SizedBox(height: 140.0),
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          ButtonComponent(
                            minHeight: 45,
                            isLoading: false,
                            minWidth: size.width * 0.45,
                            text: 'Siguiente',
                            function: selectedUtensils.isEmpty ? null : () =>  Navigator.pushNamed(context, 'nutritionaltable'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}