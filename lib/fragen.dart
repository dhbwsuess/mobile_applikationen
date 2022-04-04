import 'importe.dart';

class Fragen extends StatefulWidget {

  final Themen thema;
  const Fragen({Key? key, required this.thema}) : super(key: key);

  @override
  _FragenState createState() => _FragenState();
}

class _FragenState extends State<Fragen> {


  var controllerFrage = TextEditingController();
  var controllerAntwort = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: const Text("Frage erstellen"),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: controllerFrage,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Frage eingeben',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: controllerAntwort,
                obscureText: false,
                decoration: const InputDecoration(

                  border: OutlineInputBorder(),
                  labelText: 'Antwort eingeben',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => frageSpeichern(context),
                child: const Text("Frage speichern"),
              ),
            )
          ],
        ),
      )
    );
  }

  void frageSpeichern(BuildContext context) {
    widget.thema.fragen = [...widget.thema.fragen, [controllerFrage.text, controllerAntwort.text]];
    Navigator.pop(context);
  }
}
