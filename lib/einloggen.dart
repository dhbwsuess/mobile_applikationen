import 'importe.dart';

class Einloggen extends StatefulWidget {
  const Einloggen({Key? key}) : super(key: key);

  @override
  State<Einloggen> createState() => _EinloggenState();
}

class _EinloggenState extends State<Einloggen> {

  var myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              controller: myController,
              obscureText: false,
              decoration: const InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: OutlineInputBorder(),
                labelText: 'Benutzer',
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Second()),
            ),
            child: const Text("Einloggen"),
          ),
        ],
      )
    );
  }
}
