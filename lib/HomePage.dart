import 'package:psd/utilities/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'SecondScreen.dart';
import 'API/Fetch_data.dart';
import 'Models/data_Model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<data_Model> futureAlbum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<data_Model>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // to test
          print('--------------snapshot.hasData ------------');
         // print('--------------image ${snapshot.data.trainerImg} ------------');
          return   Stack(

            children: <Widget>[
              Container(
                color: Colors.white,
              ),
              _Column_UI(
                  snapshot.data.imags_list.toList(),
                  snapshot.data.title,
                  snapshot.data.interest,
                  snapshot.data.date,
                  snapshot.data.address,
                  snapshot.data.trainerName,
                  snapshot.data.trainerImg.toString(),
                  snapshot.data.trainerInfo,
                  snapshot.data.occasionDetail),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 10, left: 3, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                          child: FlatButton(
                            onPressed: () {
                              // do to anything
                            },
                            child: Icon(
                              Icons.star_border,
                              color: Colors.white,
                              //size: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                          child: FlatButton(
                            onPressed: () {
                              // do to anything
                            },
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                              //size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),

//                    SizedBox(
//                      width: MediaQuery.of(context).size.width*.1,
//                      child: FlatButton(
//                        onPressed: (){},
//                        child:  Icon(
//                          Icons.star_border,
//                          color: Colors.white,
//                          //size: 25,
//                        )
//                        ,),
//

                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1,
                      child: FlatButton(
                        onPressed: () {
                          // to do any thing
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondScreen(),
                              ));
                        },
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          //size: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.purple,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: RaisedButton(
//                shape: new RoundedRectangleBorder(
//                    borderRadius: new BorderRadius.circular(30.0)),

                      child: Text(
                        ' قم بالحجز الان',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      // color: Colors.purple,
                    ),
                  )),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget _Column_UI(
      List img,
      String title,
      String interest,
      String date,
      String address,
      String trainerName,
      String trainerImg,
      String trainerInfo,
      String occasionDetail) {

    List<NetworkImage> images = List<NetworkImage>();
    for(var item in img){
      images.add(NetworkImage(item));
    }


    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 6.0,
              dotIncreasedColor: Colors.white,
              dotBgColor: Colors.transparent,
              dotPosition: DotPosition.bottomLeft,
              dotVerticalPadding: 10.0,
              showIndicator: true,
              indicatorBgPadding: 7.0,
              images: images

            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '# $interest',
                      textDirection: TextDirection.rtl,
                      style: text_light,
                    ),
                    Text(
                      title,
                      textDirection: TextDirection.rtl,
                      style: text_med,
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              date,
                              textDirection: TextDirection.rtl,
                              style: text_med,
                              maxLines: 2,
                            )),
                        Icon(Icons.date_range)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Text(
                              address,
                              textDirection: TextDirection.rtl,
                              style: text_med,
                              maxLines: 2,
                            )),
                        Icon(Icons.pin_drop)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Text(
                            trainerName,
                            textDirection: TextDirection.rtl,
                            style: text_light,
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(trainerImg),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Text(
                        trainerInfo,
                        textDirection: TextDirection.rtl,
                        style: text_med,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'عن الدوره ',
                      textDirection: TextDirection.rtl,
                      style: text_light,
                    ),
                    Text(
                      occasionDetail,
                      textDirection: TextDirection.rtl,
                      style: text_med,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'تكلفه الدوره',
                      textDirection: TextDirection.rtl,
                      style: text_light,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'SAR40',
                          textDirection: TextDirection.rtl,
                          style: text_med,
                        ),
                        Text(
                          'الحجز العادى',
                          textDirection: TextDirection.rtl,
                          style: text_med,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'SAR80',
                          textDirection: TextDirection.rtl,
                          style: text_med,
                        ),
                        Text(
                          ' الحجز المميز',
                          textDirection: TextDirection.rtl,
                          style: text_med,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'SAR120',
                          textDirection: TextDirection.rtl,
                          style: text_med,
                        ),
                        Text(
                          'الحجز السريع',
                          textDirection: TextDirection.rtl,
                          style: text_med,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 45),
          )
        ],
      ),
    );
  }
}
