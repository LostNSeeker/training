import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Picknupload extends StatefulWidget {
  const Picknupload({super.key});

  @override
  State<Picknupload> createState() => _PicknuploadState();
}

class _PicknuploadState extends State<Picknupload> {
  File? image;
  double _selectedAmount=10000.0;
  final TextEditingController _amountController = TextEditingController();
  
  final ImagePicker picker=ImagePicker();
  
  Future<void> getImage(ImageSource source) async
  {
    final pickedFile =await ImagePicker().pickImage(source: source);
    if(pickedFile!=null){
      setState(() {
        image=File(pickedFile.path);
      });
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(value: _selectedAmount,
              min:10000,
              max: 1000000,
              divisions: 20,
              label: '  ${_selectedAmount.round()}',
              onChanged: (value)
          {
            setState(() {
              _selectedAmount=value;
              _amountController.text='# ${_selectedAmount.round()}';
            });

          }),

        SizedBox(height: 10,),

          TextFormField(
            controller: _amountController,
            decoration: InputDecoration(
              labelText: 'Selected amount',
              border: OutlineInputBorder(),
            ),
              readOnly: true,
          ),
          SizedBox(height: 10,),

          Center(
            child: image==null?Text('No image selected'):Image.file(image!),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
               getImage(ImageSource.gallery);
              }, child: Text('Choose from gallery')),
              SizedBox(height:10),
              ElevatedButton(onPressed: (){
                getImage(ImageSource.camera);
              }, child: Text('Take a Photo')),
            ],
          )


           ] ),
          )

    );

  }
}
