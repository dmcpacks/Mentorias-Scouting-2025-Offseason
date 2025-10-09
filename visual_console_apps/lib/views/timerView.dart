import 'package:flutter/material.dart';
import 'package:visual_console_apps/extras/diceRoller.dart';
import 'package:visual_console_apps/extras/guess.dart';
import 'package:visual_console_apps/extras/timer.dart';

class timerView extends StatefulWidget {
  const timerView({super.key});

  @override
  State<timerView> createState() => _timerViewState();
}

class _timerViewState extends State<timerView> {

  TextEditingController hoursCont = TextEditingController();
  TextEditingController minsCont = TextEditingController();
  TextEditingController secsCont = TextEditingController();

  int seconds = 0;
  bool paused = false;
  bool running = false;
  String timerText = "00:00:00";

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
          SizedBox(height:10),
          Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Hours',
                  ),
                  controller: hoursCont,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(":",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                ),
              ),

              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Minutes',
                  ),
                  controller: minsCont,
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(":",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                ),
              ),

              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Seconds',
                  ),
                  controller: secsCont,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),

          //End of inputs

          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(!running)
              ElevatedButton(
                onPressed: () {
                  running = true;
                  paused = false;
                  seconds = (int.tryParse(hoursCont.text) ?? 0)*3600 + (int.tryParse(minsCont.text) ?? 0)*60 + (int.tryParse(secsCont.text) ?? 0);
                  startTimer();
                }, 
                child: const Text("Set timer")
              ),

              if(running)
              ElevatedButton(
                
                onPressed: () {
                  setState(() {
                    running = false;
                    paused = false;
                  });
                }, 
                child: const Text("Stop")
              ),
              if(running)
              SizedBox(width: 10),

              if(paused && running)
              ElevatedButton(
                onPressed: () {
                  running = true;
                  paused = false;
                  startTimer();
                }, 
                child: const Text("Resume")
              ),

              if(!paused && running)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    running = true;
                    paused = true;
                  });
                }, 
                child: const Text("Pause")
              ),
            ],
          ),
          SizedBox(height:10),
          Text(timerText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 64,
            fontWeight: FontWeight.bold
          ))
        ],
      ),
    );
  }

  bool counting = false;
  void startTimer() async {
    if(!counting) {
      counting = true;
      while(!paused && running) {
        setState(() {
          seconds--;
          timerText = time(seconds);
        });
        await Future.delayed(const Duration(seconds: 1));
        if(seconds <= 0) {
          setState(() {
            running = false;
          });
        }
      }
      counting = false;
    }
  }
}
