import 'package:flutter/material.dart';
import 'package:web_application/data/app_platform.dart';

import '../data/load_data.dart';
import '../data/site_info.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  final inputController = TextEditingController();
  String siteUrl = '';
  late Future<SiteInfo> siteInfo = LoadData('').getData();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void _updateForm(String value) {
    setState(() {
      siteInfo = LoadData(value).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: siteInfo,
        builder: (context, AsyncSnapshot snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppBar(
                  title: Center(
                      child:
                          Text(snapshot.hasData ? snapshot.data.title : ''))),
              SizedBox(
                height: 30,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      snapshot.hasData
                          ? (snapshot.data.cors.isEmpty
                              ? ''
                              : 'CORS: ${snapshot.data.cors}')
                          : '',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Center(
                      child: SingleChildScrollView(
                          child: (snapshot.connectionState ==
                                      ConnectionState.active ||
                                  snapshot.connectionState ==
                                      ConnectionState.waiting)
                              ? const CircularProgressIndicator()
                              : snapshot.hasData
                                  ? Text(snapshot.data.html)
                                  : snapshot.hasError
                                      ? Text(snapshot.error.toString())
                                      : const Text('')))),
              SizedBox(
                height: 5,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 40,
                          child: TextField(
                            controller: inputController,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.search),
                              labelText: 'Go',
                            ),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                                width: 100,
                                height: 40,
                                child: ElevatedButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.purple),
                                    onPressed: () =>
                                        _updateForm(inputController.value.text),
                                    child: const Text(
                                      'LOAD',
                                      style: TextStyle(color: Colors.white),
                                    ))))
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                      child: Text(
                          'Application running on ${AppPlatform.platform.toString()}')))
            ],
          );
        });
  }
}
