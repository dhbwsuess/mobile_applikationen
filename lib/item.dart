import 'importe.dart';

class Item extends StatefulWidget {

  final Themen thema;

  const Item ({Key? key, required this.thema}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  @override
  Widget build(BuildContext context) {

    String tag = widget.thema.titel;

    return Hero(
      tag: tag,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.thema.quizErstellen(),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Container(
                    color: widget.thema.farbe,
                    child: Center(
                      child: widget.thema.icon,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Center(
                    child: Text(
                      tag,
                      style: const TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pickIcon() async {
    IconData? iconAusgewaehlt = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    widget.thema.icon = Icon(iconAusgewaehlt);
    setState(() {});
  }
}



