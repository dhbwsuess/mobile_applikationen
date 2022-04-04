import 'importe.dart';

class Abfrage extends StatefulWidget {

  final Themen thema;
  const Abfrage({Key? key, required this.thema}) : super(key: key);

  @override
  _AbfrageState createState() => _AbfrageState();
}

class _AbfrageState extends State<Abfrage> {

  var controllerAntwort = TextEditingController();
  int fragenZaehler = 0;

  @override
  Widget build(BuildContext context) {

    try {
      return Scaffold(
        appBar: AppBar(
          title: Text("Die Stunde der Wahrheit"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.thema.fragen[fragenZaehler][0],
                  maxLines: null,
                  overflow: TextOverflow.visible,
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controllerAntwort,
                maxLines: null,
                keyboardType: TextInputType.multiline,
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
                onPressed: () => antwortTesten(),
                child: const Text("Antwort überprüfen"),
              ),
            )
          ],
        ),
      );

    } catch(e) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Keine Fragen vorhanden"),
        ),
        body: const Center(
          child: Icon(Icons.question_mark),
        ),
      );
    }
  }

  void antwortTesten() {
    if (controllerAntwort.text == widget.thema.fragen[fragenZaehler][1]) {
      widget.thema.statistik[0] += 1;
      aufloesung(context, "Richtig!", const Icon(Icons.thumb_up));
    } else {
      widget.thema.statistik[1] += 1;
      aufloesung(context, "Leider falsch!", const Icon(Icons.thumb_down));
    }
  }

  void aufloesung(BuildContext context, String antwort, Icon icon) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Center(
          child: Text(antwort),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            TextButton(onPressed: () => naechsteFrage(), child: const Text("Nächste Frage"))
          ],
        ),
      )
    );
  }

  void naechsteFrage() {
    fragenZaehler += 1;
    if (fragenZaehler == widget.thema.fragen.length) {
      fragenZaehler = 0;
    }
    setState(() {
      controllerAntwort.text = "";
      Navigator.pop(context);
    });
  }
}
