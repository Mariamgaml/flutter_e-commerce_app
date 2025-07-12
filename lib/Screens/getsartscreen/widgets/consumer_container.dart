
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/getsartscreen/widgets/Button%20Widget.dart';
import 'package:flutter_application_1/Screens/getsartscreen/widgets/Call-to-Action%20Widget.dart';
import 'package:flutter_application_1/Screens/getsartscreen/widgets/body_consumer.dart';

class CustomDartContainer extends StatelessWidget {
  const CustomDartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width : double.infinity,
        height : double.infinity,
       
        
        child: Center(
          child: Padding(padding: const EdgeInsets.only(top:400),
          
          child: Column(
             
          
           
            children:
            
             [
              HeaderTextWidget(),
              CTAWidget(),
              GetStartedButton(),

            ],
          ),
        ),
        ) 
        );
  }
}