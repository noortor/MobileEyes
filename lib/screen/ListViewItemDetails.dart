import 'package:flutter/material.dart';
import 'package:flutter_listview_app/model/Item.dart';
import 'package:intl/intl.dart';

String getImageUrl(int registrants) {
  var suffix = "";
  if (registrants >= 100)
    suffix = "full";
  else if (registrants >= 50)
    suffix = "large";
  else if (registrants >= 10)
    suffix = "med";
  else if (registrants >= 2)
    suffix = "2";
  else if (registrants >= 1) suffix = "1";
  var url = "assets/images/bg_" + suffix + ".png";
  return url;
}

class _ListItemDetailsState extends State<ListItemDetails> {
  final Item item;
  int _registrants = 1;

  _ListItemDetailsState(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: Text(item.name),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
            child: Text(
              this.item.purpose,
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(getImageUrl(this._registrants)),
          InkWell(
            onTap: () {
              this.item.isGoing = true;
              setState(() {
                _registrants *= 5;
              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              width: 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  'Check In',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0.0, 5.0, 50.0, 5.0),
              child: RichText(
                  text: TextSpan(
                style: Theme.of(context).textTheme.body1,
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(Icons.timer),
                    ),
                  ),
                  TextSpan(
                      text:
                          DateFormat("MM/dd/yyyy - hh:mm a").format(item.time),
                      style: TextStyle(fontSize: 19)),
                ],
              ))),
          Container(
              margin: EdgeInsets.fromLTRB(0.0, 5.0, 50.0, 5.0),
              child: RichText(
                  text: TextSpan(
                style: Theme.of(context).textTheme.body1,
                children: [
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Icon(Icons.home),
                    ),
                  ),
                  TextSpan(
                      text: this.item.address, style: TextStyle(fontSize: 19)),
                ],
              ))),
          SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
            child: Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
            child: Text(
              this.item.description,
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
            child: Text(
              'Tags',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black87,
              ),
            ),
          ),
          GetTags(this.item),
        ],
      ),
    );
  }
}

class ListItemDetails extends StatefulWidget {
  final Item item;

  ListItemDetails(this.item);

  @override
  _ListItemDetailsState createState() => _ListItemDetailsState(item);
}

class GetTags extends StatelessWidget {
  final Item item;

  GetTags(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
      height: 35.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: this
            .item
            .tags
            .map(
              (e) => InkWell(
                onTap: () => {},
                child: Container(
                  width: 150.0,
                  height: 35.0,
                  margin: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Center(
                    child: Text(
                      '#' + e,
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class SetTagsItem extends StatelessWidget {
  final String tag;

  SetTagsItem(this.tag);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        width: 100.0,
        height: 35.0,
        margin: EdgeInsets.only(
          left: 5.0,
          right: 5.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF761322),
          border: Border.all(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            tag,
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class HeaderBanner extends StatelessWidget {
  final Item item;

  HeaderBanner(this.item);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      child: Container(
        height: 380.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //HeaderImage(this.item.bannerUrl),
            HeaderContent(this.item),
          ],
        ),
      ),
    );
  }
}

class HeaderImage extends StatelessWidget {
  final String bannerUrl;

  HeaderImage(this.bannerUrl);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      bannerUrl,
      width: 600.0,
      height: 380.0,
      fit: BoxFit.cover,
    );
  }
}

class HeaderContent extends StatelessWidget {
  final Item item;

  HeaderContent(this.item);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        //color: Colors.black.withOpacity(0.1),
        constraints: BoxConstraints.expand(
          height: 110.0,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 1.0),
                        child: Text(
                          item.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //GetRatings(),
                      // Container(
                      //   margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      //   child: Text(
                      //     item.directors,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 15.0,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   //margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      //   child: Text(
                      //     item.releaseDateDesc,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 15.0,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //child:
        ),
      ),
    );
  }
}

class GetTrailers extends StatelessWidget {
  final Item item;

  GetTrailers(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // Container(
          //   child: Image.asset(
          //     item.trailerImg1,
          //     width: 160.0,
          //     height: 100.0,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.only(left: 5.0),
          //   child: Image.asset(
          //     item.trailerImg2,
          //     width: 160.0,
          //     height: 100.0,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.only(left: 5.0),
          //   child: Image.asset(
          //     item.trailerImg3,
          //     width: 160.0,
          //     height: 100.0,
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }
}
