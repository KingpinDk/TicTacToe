import 'package:flutter/material.dart';
//by DK
class MatrixCompo extends StatefulWidget {
  late int x,y;
  late Color gridColor;
  late String str;
  MatrixCompo(this.str,this.gridColor,this.x, this.y, {super.key});

  @override
  State<MatrixCompo> createState() => _MatrixCompoState();
}

class _MatrixCompoState extends State<MatrixCompo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.gridColor
      ),
      height: 100.0,
      width: 100.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: Text(widget.str, style: const TextStyle(color: Colors.white,fontSize: 70.0),textAlign: TextAlign.center,),
    );
  }
}
