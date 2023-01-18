import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({ this.onchange,this.hintext ,this.obscure=false});
String? hintext;
bool? obscure;
Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      validator: (data){
        if (data!.isEmpty)
        return 'value is wrong';

      },
      onChanged:onchange ,
      style: TextStyle(color: Colors.blue),
            decoration: InputDecoration(
              hintText: hintext ,
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide:BorderSide(
                  color: Colors.white
                ) 
              
              
              ),
focusedBorder: OutlineInputBorder(
  borderSide:BorderSide(
  color: Colors.blue

)
),
            ),
             );
  }
}