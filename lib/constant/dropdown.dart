import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class DropDown extends StatelessWidget {
  const DropDown({
    Key? key,
    required this.itemList,
    required this.select, 
    required this.labelText, 
    required this.prefixIcon, 
    required this.valuedata,
  }) : super(key: key);

  final List<String> itemList;
  final select;
  final String labelText;
  final IconData prefixIcon;
  final String valuedata;

  @override
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      alignment: Alignment.center,
      hint: Text(
        labelText,
        style: TextStyle(color: Colors.cyan),
      ),
      items: itemList.map((item) => 
        DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ).toList(), 
      value: valuedata,
      onChanged: (value){
       select(value);
      },
      itemPadding: const EdgeInsets.only(left: 30),
      icon: const Icon(Icons.keyboard_arrow_down),
      selectedItemHighlightColor: Colors.cyan,
      focusColor: Colors.cyan,
      iconEnabledColor: Colors.cyan,
      decoration: InputDecoration(
        labelText:labelText ,
        prefixIcon: Icon(prefixIcon,color: themeColor,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.cyan)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.cyan)
        ),
      ),
    );
  }
}