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
  bool boxOpen = false;

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
            padding:
                const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 8),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              elevation: const MaterialStatePropertyAll(0),
            ),
            onPressed: () {
              setState(() {
                boxOpen = !boxOpen;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(selectedItem,
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
            if (boxOpen == true) {
              return Center(
                child: Container(
                  width: constraint.maxWidth,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                    child: Scrollbar(
                      radius: const Radius.circular(30),
                      thickness: 12,
                      thumbVisibility: true,
                      child: ListView.builder(
                        itemExtent: 30,
                        itemCount: widget.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Color(0x11000000)),
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
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
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
