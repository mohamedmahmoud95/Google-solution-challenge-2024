import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/reusable widget/image_picker/image_picker.dart';
import '../../../../../core/reusable widget/text_fields_and_search_bar/text_field.dart';


class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {

  File? productPicFile;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new product"),
      ),

      body: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [


      ImagePickerWidget(imageFile: productPicFile,),

    TextFieldWidget(
    title: 'Product name',
    textEditingController: productNameController,
    ),

    TextFieldWidget(
    title: 'Price',
    textEditingController: productPriceController,
    ),

    TextFieldWidget(
    title: 'Decription',
    textEditingController: productDescriptionController,
    ),
    ],
      ),
    ),
    );


  }
}



