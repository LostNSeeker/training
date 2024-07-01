import 'package:flutter/material.dart';


class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});


  @override
  State<StepperDemo> createState() => _StepperDemoState();
}


class _StepperDemoState extends State<StepperDemo> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stepper(
        currentStep: currentStep ,
        onStepContinue: (){
          setState(() {
            if(currentStep <2){
              currentStep+=1;
            }
          });
        },
        onStepCancel: (){
          setState(() {
            if(currentStep >0){
              currentStep-=1;
            }
          });
        },
        steps: [
          Step(
              title: Text('Step 1'),
              content: Column(
                children: [
                  Text('Content of Step 1'),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter Something'),
                  )
                ],
              ),
              isActive: currentStep >=0
          ),
          Step(
              title: Text('Step 2'),
              content: Column(
                children: [
                  Text('Content of Step 3'),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter Something'),
                  )
                ],
              ),
              isActive: currentStep >=1
          ),
          Step(
              title: Text('Step 3'),
              content: Column(
                children: [
                  Text('Content of Step 3'),

                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Enter Something'),
                  )
                ],
              ),
              isActive: currentStep >=2
          ),
        ]
        ,
      ),
    );
  }
}


