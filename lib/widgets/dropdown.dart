import 'package:flutter/material.dart';

class WideDropDown extends StatefulWidget {
  final List<String> data;
  final String title;
  const WideDropDown({
    super.key,
    required this.data,
    required this.title,
  });

  @override
  State<WideDropDown> createState() => _WideDropDownState();
}

class _WideDropDownState extends State<WideDropDown> {
  late String selectedItem;

  @override
  void initState() {
    selectedItem = widget.data.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: ButtonTheme(
                    child: DropdownButton(
                      value: selectedItem,
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (value) =>
                          setState(() => selectedItem = value.toString()),
                      items: widget.data
                          .map(
                            (item) => DropdownMenuItem<String>(
                                value: item, child: Text(item)),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
