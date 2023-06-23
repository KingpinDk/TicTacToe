import 'package:flutter/material.dart';
import 'package:tictactoe/play_page.dart';
//by DK
void main() {
  runApp(const MaterialApp(
      home: TicTacToe(),
    debugShowCheckedModeBanner: false,
  )
  );
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          centerTitle: true,
          elevation: 10.0,
          title: const Padding(
            padding: EdgeInsets.all(8.0),
            child:  Text("Tic Tac Toe",
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(

                    onPressed:(){
                      Navigator.push(context,MaterialPageRoute(builder:(context) => const PlayPage()));
                    },
                    child: const  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Player 1  VS  Player 2",

                        style: TextStyle(
                          letterSpacing: 1.0,
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    )
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context) => const PlayPage()));

                    },
                    child: const Text(
                      "Player  VS  System",
                      style: TextStyle(
                        letterSpacing: 1.0,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

