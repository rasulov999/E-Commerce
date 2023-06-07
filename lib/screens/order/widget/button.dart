import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyButton extends StatefulWidget {
  MyButton({super.key, required this.count});
  int count;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ZoomTapAnimation(
            onTap: () {
              if (widget.count > 0) {
                setState(() {
                  widget.count--;
                });
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "-",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Text(
            "${widget.count}",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          ZoomTapAnimation(
            onTap: () {
              setState(() {
                
                widget.count++;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "+",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
