import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.amberAccent,
              width: 4,
            )),
        child: Form(
            key: key,
            child: TextFormField(
              // controller: passText,
              validator: (value) {
                if (value.isEmpty)
                  return " password can't be empty";
                else if (value.length > 8)
                  return "passworld lenght must be >=8";
                return null;
              },
              // obscureText: _pass[index],
              decoration: InputDecoration(
                errorStyle: TextStyle(
                  fontSize: 18,
                ),
                // suffixIcon: IconButton(
                //     icon: _pass[index]
                //         ? Icon(Icons.visibility_off)
                //         : Icon(Icons.visibility),
                //     onPressed: () => {
                //           setState(() {
                //             _pass[index] = !_pass[index];
                //           })
                //         }),
                border: InputBorder.none,
                hintText: "Heloo",
              ),
            )),
      ),
    );
  }
}
