import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class GenderDropdown extends StatefulWidget {
  final String? value;
  final Function(String?) onChanged;

  const GenderDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25),
      child: DropdownButton<String>(
        dropdownColor: MyColors.lightGrey,
        itemHeight: 50.0,
        isExpanded: true,
        icon: Image.asset("assets/images/icon_tic.png"),
        underline: Container(),
        items: const [
          DropdownMenuItem<String>(
            value: "Male",
            child: Text(
              "Male",
              style: TextStyle(
                color: Colors.white,
                 
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: "Female",
            child: Text(
              "Female",
              style: TextStyle(
                color: Colors.white,
                 
              ),
            ),
          ),
          DropdownMenuItem<String>(
            value: "Prefer not to say",
            child: Text(
              "Prefer not to say",
              style: TextStyle(
                color: Colors.white,
                 
              ),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
          widget.onChanged(value);
        },
        value: _selectedValue,
      ),
    );
  }
}