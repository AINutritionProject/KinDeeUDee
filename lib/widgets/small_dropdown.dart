import 'package:flutter/material.dart';

class SmallDropDown extends StatefulWidget {
  final List<String> data;
  final Color color;
  const SmallDropDown({
    super.key,
    this.color = Colors.white,
    required this.data,
  });

  @override
  State<SmallDropDown> createState() => _SmallDropDownState();
}

class _SmallDropDownState extends State<SmallDropDown> {
  late String selectedItem = "";
  bool boxOpen = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                minimumSize: const MaterialStatePropertyAll(Size(0, 0)),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 6, horizontal: 10)),
                backgroundColor: MaterialStatePropertyAll(widget.color),
                elevation: const MaterialStatePropertyAll(0)),
            onPressed: () {
              setState(() {
                boxOpen = !boxOpen;
              });
            },
            child: SizedBox(
              width: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
            if (boxOpen) {
              return Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 100,
                  decoration: BoxDecoration(
                    color: widget.color,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: ListView.builder(
                        itemExtent: 30,
                        itemCount: widget.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.all(0)),
                              minimumSize:
                                  const MaterialStatePropertyAll(Size(0, 0)),
                              overlayColor: const MaterialStatePropertyAll(
                                  Color(0x11000000)),
                              backgroundColor:
                                  MaterialStatePropertyAll(widget.color),
                              elevation: const MaterialStatePropertyAll(0),
                              splashFactory: InkRipple.splashFactory,
                            ),
                            onPressed: () async {
                              setState(() async {
                                selectedItem = widget.data[index];
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  setState(() {
                                    boxOpen = false;
                                  });
                                });
                              });
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.data[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              );
            } else {
              return Container();
            }
          })
        ],
      ),
    );
  }
}
