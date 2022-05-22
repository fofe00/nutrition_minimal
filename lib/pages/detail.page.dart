import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;
  Detail({this.heroTag,this.foodName,this.foodPrice});


  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var selectedCard='WEIGHT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
            "Detail",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 18,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {

            },
            color: Colors.white,
          )
        ],
      ) ,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75,
                child: Container(
                  height: MediaQuery.of(context).size.height-102,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: (MediaQuery.of(context).size.width/2)- 100.0,
                child: Hero(
                  tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover
                      )
                    ),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              Positioned(
                top: 250,
                left: 25,
                right: 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.foodName,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 22,
                        color: Colors.grey
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            widget.foodPrice,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 25,
                          color: Colors.grey,
                          width: 1,
                        ),
                        Container(
                          width: 125,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Color(0xFF7A9BEE),
                            //color: Colors.deepPurple
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Color(0xFF7A9EE),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: Colors.white
                                ),
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7A9BEE),
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buidInfoCard('WEIGHT','300',"G"),
                          SizedBox(
                            width: 10,
                          ),
                          _buidInfoCard('CALORIE','267',"CAL"),
                          SizedBox(
                            width: 10,
                          ),
                          _buidInfoCard('VITAMINES','A,B6',"VIT"),
                          SizedBox(
                            width: 10,
                          ),
                          _buidInfoCard('AVAIL','NO',"AV"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight:Radius.circular(20),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)
                          ),
                          color: Colors.black,
                        ),
                        height: 70,
                        child: Center(
                          child: Text(
                            '\$52.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat"
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _buidInfoCard(String cardTitle,String info,String unit) {
    return InkWell(
      onTap: () {
        selectCard(cardTitle);
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle==selectedCard?Color(0xFF7A9BEE):Colors.white,
          border: Border.all(
            color: cardTitle==selectedCard?Colors.transparent:Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
            width: 0.75
          ),
        ),
        height: 120,
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                cardTitle,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  color: cardTitle==selectedCard?Colors.white:Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Column(
                children: [
                  Text(
                    info,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        color: cardTitle==selectedCard?Colors.white:Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text(
                    unit,
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 12,
                        color: cardTitle==selectedCard?Colors.white:Colors.black
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  selectCard(cardTitle){
    setState(() {
      selectedCard=cardTitle;
    });
  }
}


