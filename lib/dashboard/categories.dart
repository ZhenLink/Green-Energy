import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 1,
          color: Colors.blueGrey[900],
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('assets/stendy-solar-home.jpg'),
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  height: 150,
                  width: double.maxFinite,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Full Solar System',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Text(
                        'A full solar installation that supplies electricity to the whole house independently from the main electric power.',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        softWrap: true,
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('assets/Hybrid.jpg'),
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.darken,
                  height: 150,
                  width: double.maxFinite,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Backup Solar System',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Text(
                        'A full solar installation that is connected to the main electrical power which  automatically switches on/off depending on the availability of main power.',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        softWrap: true,
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
