import 'package:flutter/material.dart';
import 'package:tictactoe/matrix_component.dart';
import 'grid_properties.dart';
//by DK

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  //variables
  var symbol1 = "O", symbol2 = "X", cnt = 1;
  List<List<GridProperties>> table = [
    [GridProperties(Colors.brown, " ", 0, 0),GridProperties(Colors.brown, " ", 0, 1),GridProperties(Colors.brown, " ", 0, 2)],
    [GridProperties(Colors.brown, " ", 1, 0),GridProperties(Colors.brown, " ", 1, 1),GridProperties(Colors.brown, " ", 1, 2)],
    [GridProperties(Colors.brown, " ", 2, 0),GridProperties(Colors.brown, " ", 2, 1),GridProperties(Colors.brown, " ", 2, 2)],
  ];
  //methods
  bool isWin(int x, int y)
  {
    if(table[x][0].str == table[x][1].str && table[x][1].str == table[x][2].str)
    {return true;}
    else if(table[0][y].str == table[1][y].str && table[2][y].str == table[1][y].str)
    {return true;}
    else if(x == y && table[0][0].str == table[1][1].str && table[1][1].str == table[2][2].str)
    {return true;}
    else if((x == 0 && y == 2) || (x == 2 && y == 0) || (x == 1 && y == 1))
    {
      if(table[0][2].str == table[2][0].str && table[1][1].str == table[2][0].str) {
        return true;
      }
    }
    return false;
  }
  void _colorChange(int x, int y){
    if(table[x][y].str == " "){
    if(cnt%2 == 0)
    {
      setState(() {
        table[x][y].gridColor = Colors.blue;
        table[x][y].str = "X";
      });
    }
    else
    {
      setState(() {
        table[x][y].gridColor = Colors.red;
        table[x][y].str = "O";
      });
    }
    if(isWin(x,y))
      {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("Congratulations Player ${(cnt%2 == 0)?1:2} Won!!"),
              elevation: 25.0,
              content: Image.asset('assets/images/winner_cup.png', height: 150.0,width: 70.0,),
              actions: [
                TextButton(onPressed: () {Navigator.of(context).pop();},
                  child: const Text("No"),
                ),
                TextButton(onPressed:()=> setState(() {
                  table = [
                    [GridProperties(Colors.brown, " ", 0, 0),GridProperties(Colors.brown, " ", 0, 1),GridProperties(Colors.brown, " ", 0, 2)],
                    [GridProperties(Colors.brown, " ", 1, 0),GridProperties(Colors.brown, " ", 1, 1),GridProperties(Colors.brown, " ", 1, 2)],
                    [GridProperties(Colors.brown, " ", 2, 0),GridProperties(Colors.brown, " ", 2, 1),GridProperties(Colors.brown, " ", 2, 2)],
                  ];
                  cnt = 0;
                  Navigator.of(context).pop();
                }), child: const Text("Play Again"))
              ],
            ),
            
            barrierDismissible: false,
        );
    
      }
    cnt++;}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.red
                ),
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child:Text("Player 1 \n \t\t\t\t $symbol1",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.lightBlue
                ),
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child:Text("Player 2 \n \t\t\t\t $symbol2",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //0,0
              InkWell(
                onTap: ()=>_colorChange(0,0),
                child: MatrixCompo(table[0][0].str,table[0][0].gridColor,0,0),
              ),
              //0,1
              InkWell(
                onTap: ()=>_colorChange(0,1),
                child: MatrixCompo(table[0][1].str,table[0][1].gridColor,0,1),
              ),
              //0,2
              InkWell(
                onTap: ()=>_colorChange(0,2),
                child: MatrixCompo(table[0][2].str,table[0][2].gridColor,0,2),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //1,0
              InkWell(
                onTap: ()=>_colorChange(1,0),
                child: MatrixCompo(table[1][0].str,table[1][0].gridColor,1,0),
              ),
              //1,1
              InkWell(
                onTap: ()=>_colorChange(1,1),
                child: MatrixCompo(table[1][1].str,table[1][1].gridColor,1,1),
              ),
              //1,2
              InkWell(
                onTap: ()=>_colorChange(1,2),
                child: MatrixCompo(table[1][2].str,table[1][2].gridColor,1,2),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //2,0
              InkWell(
                onTap: ()=>_colorChange(2,0),
                child: MatrixCompo(table[2][0].str,table[2][0].gridColor,2,0),
              ),
              //2,1
              InkWell(
                onTap: ()=>_colorChange(2,1),
                child: MatrixCompo(table[2][1].str,table[2][1].gridColor,2, 1),
              ),
              //2,2
              InkWell(
                onTap: ()=>_colorChange(2, 2),
                child: MatrixCompo(table[2][2].str,table[2][2].gridColor,2,2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
