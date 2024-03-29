import 'package:flutter/material.dart';

class WideDropDown extends StatefulWidget {
  final List<String> data;
  final String? initialValue;
  final String title;
  final Color color;
  final Function(String val) setSelectedItem;
  final BorderSide border;
  final String fontFamily;
  final FontWeight fontWeight;
  const WideDropDown({
    super.key,
    required this.data,
    required this.setSelectedItem,
    this.initialValue,
    this.title = "",
    this.color = Colors.white,
    this.border = BorderSide.none,
    this.fontFamily = "NotoSansThai",
    this.fontWeight = FontWeight.w600,
  });

  @override
  State<WideDropDown> createState() => WideDropDownState();
}

class WideDropDownState extends State<WideDropDown> {
  late String selectedItem;
  bool boxOpen = false;

  late String? initialValue;

  @override
  void initState() {
    super.initState();
    initialValue = widget.initialValue;
    if (initialValue != null) {
      selectedItem = initialValue!;
    } else {
      selectedItem = widget.data.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (widget.title != "") {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 8),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontFamily: widget.fontFamily,
                        fontSize: 24,
                        fontWeight: widget.fontWeight,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: widget.border,
                  )),
                  backgroundColor: MaterialStatePropertyAll(widget.color),
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
                    Flexible(
                      flex: 8,
                      child: Text(
                        selectedItem,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: widget.fontFamily),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Flexible(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
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
                      decoration: BoxDecoration(
                          border: Border(
                              top: widget.border,
                              bottom: widget.border,
                              left: widget.border,
                              right: widget.border),
                          color: widget.color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 15, top: 10, bottom: 10, left: 5),
                        child: Scrollbar(
                          radius: const Radius.circular(30),
                          thickness: 6,
                          thumbVisibility: true,
                          child: ListView.builder(
                            itemExtent: 30,
                            itemCount: widget.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Color(0x11000000)),
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor:
                                      MaterialStatePropertyAll(widget.color),
                                  splashFactory: InkRipple.splashFactory,
                                ),
                                onPressed: () {
                                  widget.setSelectedItem(widget.data[index]);
                                  if (mounted) {
                                    setState(() {
                                      selectedItem = widget.data[index];
                                      Future.delayed(
                                          const Duration(milliseconds: 100),
                                          () {
                                        if (mounted) {
                                          setState(() {
                                            boxOpen = false;
                                          });
                                        }
                                      });
                                    });
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.data[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontFamily: widget.fontFamily),
                                    overflow: TextOverflow.ellipsis,
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
      },
    );
  }
}
