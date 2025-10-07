import 'package:flutter/material.dart';
import 'package:visual_console_apps/extras/diceRoller.dart';
import 'package:visual_console_apps/extras/guess.dart';

class guessView extends StatefulWidget {
  const guessView({super.key});

  @override
  State<guessView> createState() => _guessViewState();
}

class _guessViewState extends State<guessView> {
  
  List<int> data = [0, 100, 50, 1];
  bool greater = false;
  bool askingIs = true;
  bool found = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Spacer(),
          if(data[3] > 7 && found)
          Text("Liar liar pants on fire"),
          
          if(data[3] <= 7 && found)
          Text("I guessed your number was ${data[2]} in ${data[3]} attempts"),
          
          if(askingIs && !found)
          Text("Is your number ${data[2]}"),
          if(!askingIs && !found)
          Text("Is your number greater than ${data[2]}"),
          const SizedBox(height: 10),
          
          if(askingIs && !found)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  found = true;
                });
              },
              child: const Text("Yes")),
              const SizedBox(width: 10),

              ElevatedButton(onPressed: () {
                setState(() {
                  askingIs = false;
                });
              },
              child: const Text("No")),
            ],
          ),

          //SECOND ROW SECOND EL SEGUNDO SECONDDD
          if(!askingIs && !found)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  greater = true;
                  data = guess(data[0], data[1], data[2], data[3], greater);
                  askingIs = true;
                });
              },
              child: const Text("Yes")),
              const SizedBox(width: 10),

              ElevatedButton(onPressed: () {
                setState(() {
                  greater = false;
                  data = guess(data[0], data[1], data[2], data[3], greater);
                  askingIs = true;
                  if(data[3] > 7) {
                    found = true;
                  }
                });
              },
              child: const Text("No")),
            ],
          ),

          Spacer(),
          ElevatedButton(onPressed: () {
            setState(() {
              data = [0, 100, 50, 1];
              greater = false;
              askingIs = true;
              found = false;
            });
          },
            child: const Text("Reset attempt")
          ),
          const SizedBox(height: 10)

        ],
      ),
    );
  }
}
