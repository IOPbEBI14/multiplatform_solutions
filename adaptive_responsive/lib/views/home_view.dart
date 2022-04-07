import 'package:adaptive_responsive/views/gridview_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/hotel.dart';
import 'listview_layout.dart';

String _hotelsURL =
    'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<List<HotelPreview>>? _hotels;
  final Dio _dio = Dio();
  late String _dioError;

  getData(String url) async {
    try {
      final responce = await _dio.get(url);
      _hotels = Future.value(responce.data
          .map<HotelPreview>((hotel) => HotelPreview.fromJson(hotel))
          .toList());
      setState(() {});
    } on DioError catch (e) {
      setState(() {
        _dioError = e.message;
        _hotels = Future.error(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _hotels,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(_dioError);
              } else if (snapshot.hasData) {
                return LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth < 720) {
                    return Column(
                      children: [
                        AppBar(
                          leading: const Icon(Icons.menu),
                          title: const Center(child: Text('Adaptive App')),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            ),
                          ),
                          titleSpacing: 2,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.separated(
                              itemCount: snapshot.data.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                        height: 2,
                                        thickness: 1,
                                      ),
                              itemBuilder: (BuildContext context, int index) {
                                return ListviewLayout(
                                  hotelInfo: snapshot.data[index],
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: AppBar(
                            leading: const Icon(Icons.menu),
                            title: const Center(
                                child: Text(
                              'Adaptive App',
                              style: TextStyle(fontSize: 14),
                            )),
                            titleSpacing: 2,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: GridView.builder(
                              shrinkWrap: true,
                              controller:
                                  ScrollController(keepScrollOffset: false),
                              itemCount: snapshot.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return GridviewLayout(
                                    hotelInfo: snapshot.data[index]);
                              }),
                        ),
                      ],
                    );
                  }
                });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData(_hotelsURL);
  }
}
