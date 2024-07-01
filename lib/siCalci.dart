import 'package:flutter/material.dart';

class SiCalci extends StatefulWidget {
  const SiCalci({super.key});

  @override
  State<SiCalci> createState() => _SiCalciState();
}

class _SiCalciState extends State<SiCalci> {
  final _formKey = GlobalKey<FormState>();

  var country = ['Rupee','Euro','Dollar','Yen'];
  var defaultCountry  = 'Rupee';

  double _Principle=0;
  double _Rate=0;
  double _Time=0;
  double Interest=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Si Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(

              children: [
                Image.asset('assets/images/8906837.jpg'),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter the principal Amount',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'please enter principle amount';
                    }
                    return null;
                  },
                  onSaved: (value)=>_Principle= double.parse(value?? '0'),

                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter the Rate of Interest',
                    border: OutlineInputBorder(),

                  ),
                  validator: (value){
                    if(value!.isEmpty)
                      {
                        return 'please enter principle amount';
                      }
                    return null;
                  },
                  onSaved: (value)=>_Rate= double.parse(value?? '0'),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Terms in years',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return 'please enter principle amount';
                          }
                          return null;
                        },
                        onSaved: (value)=>_Time= double.parse(value?? '0'),

                      ),
                    ),
                    SizedBox(width: 20), // Added width for spacing between text fields
                    Expanded(
                      child: DropdownButton(
                        onChanged: (String? selectedValue){
                          setState(() {
                            defaultCountry = selectedValue!;
                          });
                        },
                        items: country.map(( String c) =>(
                            DropdownMenuItem(
                              child: Text(c),
                              value: c ,
                            )
                        )).toList(),
                        value: defaultCountry,


                      ),
                    ),
                  ],
                ),
                SizedBox(height:10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          if(_formKey.currentState!.validate())
                            {
                              _formKey.currentState!.save();
                               Interest =(_Principle*_Rate*_Time)/100;
                            }
                        },
                        child: Text('Calculate')),
                       ElevatedButton(
                        onPressed: (){
                          _formKey.currentState!.reset();
                          setState(() {
                            _Principle=0;
                            _Time=0;
                            _Rate=0;
                          });
                        },
                         child: Text('Reset')),
                            ]
                    ),
                  SizedBox(height: 10),
                Center(
                  child: Text('$Interest after $_Time years ')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

