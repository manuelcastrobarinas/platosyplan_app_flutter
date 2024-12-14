import 'package:flutter/material.dart';

typedef CategoryIconMapper = IconData Function(String category);

class CategorySelectorComponent extends StatefulWidget {

  final List<String> categories;
  final CategoryIconMapper iconMapper;
  const CategorySelectorComponent({super.key, required this.categories, required this.iconMapper});

  @override
  State<CategorySelectorComponent> createState() => _CategorySelectorComponentState();
}

class _CategorySelectorComponentState extends State<CategorySelectorComponent> {
 
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: PopupMenuButton<String>(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Colors.black12)),
        initialValue: selectedCategory,
        onSelected: (String newValue) => setState(() => selectedCategory = newValue),
        itemBuilder: (BuildContext context) {
          return widget.categories.map((String category) {
            return PopupMenuItem<String>(
              value: category,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Icon(widget.iconMapper(category), size: 20, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 10),
                    Text(category),
                  ],
                ),
              ),
            );
          }).toList();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: <Widget>[
              if (selectedCategory != null) ...<Widget>[
                Icon(widget.iconMapper(selectedCategory!), size: 20, color: Theme.of(context).primaryColor),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(selectedCategory ?? 'Selecciona una categoría', style: TextStyle(color: selectedCategory == null ? Colors.grey.shade600 : Colors.black)),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}