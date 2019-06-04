import 'package:flutter/material.dart';
import 'package:emision/utils/ui_utils.dart';

class menuRoute {
  const menuRoute(this.name, this.route, this.Widget);

  final Widget;
  final String name;
  final String route;
}

class PaginaInicio extends StatelessWidget {
  List<menuRoute> menu = <menuRoute>[
    menuRoute("Poliza Nueva", '/polizaPagination',
        Icon(Icons.add, size: 60.0, color: amarilloSolidaria1)),
    menuRoute("Amparos", '/amparos',
        Icon(Icons.text_fields, size: 60.0, color: amarilloSolidaria1)),
    menuRoute("Temporarios", '/polizas',
        Icon(Icons.list, size: 60.0, color: amarilloSolidaria1)),
    menuRoute("Conocimiento Cliente", '/auxiliares',
        Icon(Icons.people, size: 60.0, color: amarilloSolidaria1)),
    menuRoute("g_Registro", '/gregistro',
        Icon(Icons.ac_unit, size: 60.0, color: amarilloSolidaria1)),
    menuRoute("CRUD firebase", '/crudFB',
        Icon(Icons.check_circle, size: 60.0, color: amarilloSolidaria1))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú Inicio"),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0,60.0,0.0,8.0),
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/logo.png",
                scale: 0.9,
              ),
            ),
            Container(
              //alignment: AlignmentDirectional(0.0, 0.0),
              margin: EdgeInsets.only(top: 190.0),
              child: GridView(
                physics: BouncingScrollPhysics(),
                // if you want IOS bouncing effect, otherwise remove this line
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                //change the number as you want
                children: menu.map((entry) {
                  if (entry != null) {
                    return InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, entry.route),
                      child: Card(
                          margin: EdgeInsets.all(5.0),
                          color: azulSolidaria2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ListTile(
                                title: Center(
                                  child: Text(
                                    "${entry.name}",
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                subtitle: entry.Widget,
                              ),
                            ],
                          )),
                    );
                  } else
                    print("null");
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
