import 'package:flutter/material.dart';

class SmallDropDown extends StatefulWidget {
  final List<String> data;
  final Function(String val) setSelectedItem;
  final Color buttonColor;
  final Color dropdownColor;
  const SmallDropDown({
    super.key,
    required this.data,
    required this.setSelectedItem,
    this.buttonColor = Colors.white,
    this.dropdownColor = Colors.white,
  });

  @override
  State<SmallDropDown> createState() => _SmallDropDownState();
}

class _SmallDropDownState extends State<SmallDropDown> {
  late String selectedItem;

  @override
  void initState() {
    selectedItem = widget.data.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        color: widget.buttonColor,
        child: DropdownButton(
          padding: const EdgeInsets.all(7),
          icon: const Icon(Icons.arrow_drop_down),
          dropdownColor: widget.dropdownColor,
          underline: Container(),
          elevation: 10,
          value: selectedItem,
          onChanged: (Object? val) {
            widget.setSelectedItem(val.toString());
            setState(() {
              selectedItem = val.toString();
            });
          },
          items: widget.data.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
// class SmallDropDown extends StatefulWidget {
//   final List<String> data;
//   final Color color;
//   const SmallDropDown({
//     super.key,
//     this.color = Colors.white,
//     required this.data,
//   });
//
//   @override
//   State<SmallDropDown> createState() => _SmallDropDownState();
// }
//
// class _SmallDropDownState extends State<SmallDropDown> {
//   late String selectedItem = "";
//   bool boxOpen = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ElevatedButton(
//             style: ButtonStyle(
//                 minimumSize: const MaterialStatePropertyAll(Size(0, 0)),
//                 padding: const MaterialStatePropertyAll(
//                     EdgeInsets.symmetric(vertical: 6, horizontal: 10)),
//                 backgroundColor: MaterialStatePropertyAll(widget.color),
//                 elevation: const MaterialStatePropertyAll(0)),
//             onPressed: () {
//               setState(() {
//                 boxOpen = !boxOpen;
//               });
//             },
//             child: SizedBox(
//               width: 40,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     selectedItem,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                   const Icon(
//                     Icons.arrow_drop_down,
//                     color: Colors.black,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraint) {
//             if (boxOpen) {
//               return Center(
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: 60,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: widget.color,
//                   ),
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     child: ListView.builder(
//                         itemExtent: 30,
//                         itemCount: widget.data.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return ElevatedButton(
//                             style: ButtonStyle(
//                               padding: const MaterialStatePropertyAll(
//                                   EdgeInsets.all(0)),
//                               minimumSize:
//                                   const MaterialStatePropertyAll(Size(0, 0)),
//                               overlayColor: const MaterialStatePropertyAll(
//                                   Color(0x11000000)),
//                               backgroundColor:
//                                   MaterialStatePropertyAll(widget.color),
//                               elevation: const MaterialStatePropertyAll(0),
//                               splashFactory: InkRipple.splashFactory,
//                             ),
//                             onPressed: () async {
//                               setState(() async {
//                                 selectedItem = widget.data[index];
//                                 Future.delayed(
//                                     const Duration(milliseconds: 100), () {
//                                   setState(() {
//                                     boxOpen = false;
//                                   });
//                                 });
//                               });
//                             },
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 widget.data[index],
//                                 style: const TextStyle(
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 ),
//               );
//             } else {
//               return Container();
//             }
//           })
//         ],
//       ),
//     );
//   }
// }
