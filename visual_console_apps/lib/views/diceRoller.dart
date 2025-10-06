import 'package:flutter/material.dart';
import 'package:visual_console_apps/extras/diceRoller.dart';

class DiceRollerView extends StatefulWidget {
  const DiceRollerView({super.key});

  @override
  State<DiceRollerView> createState() => _DiceRollerViewState();
}

class _DiceRollerViewState extends State<DiceRollerView> {
  final TextEditingController dice = TextEditingController();
  final TextEditingController faces = TextEditingController();
  
  List<int> results = [];
  int facesAmount = 0;
  int dieAmount = 0;

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
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How many dice to roll',
            ),
            controller: dice,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),

          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'How many faces per die',
            ),
            controller: faces,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              setState(() {
                facesAmount = int.tryParse(faces.text) ?? 0;
                dieAmount = int.tryParse(dice.text) ?? 0;
                results = diceRoller(facesAmount, dieAmount);
              });
            },
            child: const Text("Roll die"),
          ),
          if (results.isNotEmpty)
              Text("${results[0]}",
                      style: TextStyle(fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
              ),

          if (results.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 1; i<results.length; i++)
                  Text("${results[i]}, ")
              ],
            )
        ],
      ),
    );
  }
}
