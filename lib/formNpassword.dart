import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyTextFieldDemo extends StatefulWidget {
  const MyTextFieldDemo({super.key});


  @override
  State<MyTextFieldDemo> createState() => _MyTextFieldDemoState();
}


class _MyTextFieldDemoState extends State<MyTextFieldDemo> {


  var _passwordError = '';
  var _gender = 'male';
  bool acceptTerms = false;
  bool _switchValue = false;


  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Panel'),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
            TextFormField(
              obscureText: true,
              onChanged: _checkPasswordValidation,
              validator: _validatePassword,
              decoration: InputDecoration(
                  hintText: 'Enter You Password',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: _passwordError.isEmpty?Colors.green:Colors.red
                    ),
                  ),
                  errorText: _passwordError.isEmpty? null : _passwordError








              ),
            ),


            SizedBox(height: 20,),


            Row(
              children: [
                Expanded(
                    child:ListTile(
                      title: Text('Male'),
                      leading: Radio<String>(
                        value: 'male',
                        groupValue: _gender,
                        onChanged: (value){
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                    )


                ),


                Expanded(
                    child:ListTile(
                      title: Text('Female'),
                      leading: Radio<String>(
                        value: 'female',
                        groupValue: _gender,
                        onChanged: (value){
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                    )


                )


              ],
            ),


            Row(
              children: [
                Text('Select Date'),
                IconButton(
                    onPressed: (){
                      _SelectDate(context);
                    },
                    icon: Icon(Icons.date_range)
                ),
                Text('${currentDate.day} ${currentDate.month} ${currentDate.year}')
              ],
            ),
            Row(
              children: [
                Text('Select Time'),
                IconButton(
                    onPressed: (){
                      _SelectTime(context);
                    },
                    icon: Icon(Icons.timer)
                ),
                Text('${currentTime.hour} ${currentTime.minute} ')
              ],
            ),
            Row(
              children: [
                Text(' wifi'),
                Switch(
                    value: _switchValue,
                    onChanged: (value){
                      setState(() {
                        _switchValue = value!;
                      });
                    }
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: acceptTerms,
                    onChanged: (value){
                      setState(() {
                        acceptTerms = value!;
                      });
                    }
                ),
                Text('I Accept the terms and conditions')
              ],
            ),
            Column(
              children: [
                Text('Gender :  $_gender')


              ],
            ),
            ElevatedButton(
                onPressed: acceptTerms?(){
                  _PreviewBeforeSubmit(context);
                }:null,
                child: Text('Send')


            )
          ],
        ),
      ),
    );
  }


  void _checkPasswordValidation(String value) {
    setState(() {
      _passwordError = _validatePassword(value)??'';
    });
  }


  String? _validatePassword(String? value) {


    if(value == null || value.isEmpty){
      return ' Please enter your password';
    }
    if(value.length < 6){
      return 'Password must be at least 6 character long';
    }
    return null;
  }


  void _SelectDate(BuildContext context) async{
    DateTime? today= await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030)
    );


    if(today!=null && today != currentDate){
      setState(() {
        currentDate = today;
      });
    }
  }


  void _SelectTime(BuildContext context) async {
    TimeOfDay? selecteTime =  await showTimePicker(
        context: context,
        initialTime: currentTime


    );
    setState(() {
      currentTime = selecteTime!;
    });
  }


  void _PreviewBeforeSubmit(BuildContext context) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text('Infomration'),
            content: Text('Are you sure to submit ?'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Yes')),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('No')),


            ],
          );
        }


    );
  }
}

