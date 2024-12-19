import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components.dart';

class SelectImageComponent extends StatefulWidget {
  final String title;
  final Size size;
  final void Function(File image) onImageSelected;
  
  const SelectImageComponent({
    super.key,
    required this.size,
    required this.title,
    required this.onImageSelected,
  });

  @override
  State<SelectImageComponent> createState() => _SelectImageComponentState();
}

class _SelectImageComponentState extends State<SelectImageComponent> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          widget.onImageSelected(_selectedImage!);
        });
      }
    } catch (e) {
      // Manejar el error
      debugPrint('Error al seleccionar imagen: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width : double.infinity,
      height: widget.size.height * 0.32,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children: [
            _selectedImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _selectedImage!,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(Icons.image, size: 50.0, color: Colors.grey[400]),
            Text(widget.title, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black)),
            ButtonComponent(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              minHeight: 45,
              isLoading: false,
              minWidth: widget.size.width * 0.45,
              text: 'Seleccionar imagen',
              function: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Seleccionar imagen'),
                      content: const Text('¿De dónde deseas seleccionar la imagen?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _pickImage(source: ImageSource.gallery);
                          },
                          child: const Text('Galería'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _pickImage(source: ImageSource.camera);
                          },
                          child: const Text('Cámara'),
                        ),
                      ],
                    );
                  },
                );
              }
            ),
            Column(
              children: [
                RichText(
                  text: const TextSpan(
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
                  children: [
                    TextSpan(text: '- Puedes subir fotos en formato', style: TextStyle(fontWeight: FontWeight.w400)),
                    TextSpan(text: ' JPG, PNG etc.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
                  ]
                )),
                RichText(
                  text: const TextSpan(
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.black),
                  children: [
                    TextSpan(text: '- Procura que la imagen sea', style: TextStyle(fontWeight: FontWeight.w400)),
                    TextSpan(text: ' horizontal.', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600)),
                  ]
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}