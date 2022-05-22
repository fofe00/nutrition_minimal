import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nutrition_minimal/pages/detail.page.dart';
class HealthyFoodPage extends StatefulWidget {
  const HealthyFoodPage({Key? key}) : super(key: key);

  @override
  State<HealthyFoodPage> createState() => _HealthyFoodPageState();
}

class _HealthyFoodPageState extends State<HealthyFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF218FBD),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.sliders),
                        color: Colors.white,
                        onPressed: () {

                        },
                      ),

                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.ellipsisV),
                        color: Colors.white,
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: [
                Text(
                  "Healthy",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Montserrat",
                    color: Colors.white
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "Foods",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 40,),
          Container(
            height: MediaQuery.of(context).size.height -185,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75))
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25,right: 20),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 360,
                    child: ListView(
                      children: [
                        _buidFooItem("assets/plate1.png","Salmon bowl",'\$24.00',context),
                        _buidFooItem("assets/plate2.png","Salmon bowl",'\$24.00',context),
                        _buidFooItem("assets/plate3.png","Salmon bowl",'\$24.00',context),
                        _buidFooItem("assets/plate6.png","Salmon bowl",'\$24.00',context),
                      ],
                    ),
                  ),
                ),
                //ici
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 65,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(Icons.search,color: Colors.black,),
                      ),
                    ),
                    Container(
                      height: 65,
                      width: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_basket_outlined,color: Colors.black,),
                      ),
                    ),
                    Container(
                      height: 65,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF1C1428),
                      ),
                      child: Center(
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buidFooItem(String imagePath,String foodName,String price,BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: 10,right: 10,top: 15),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>Detail(heroTag:imagePath ,foodName: foodName,foodPrice: price,)
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Hero(
                  tag: imagePath,
                  child: Image(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    height: 75,
                    width: 75,
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodName,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 15,
                          color: Colors.grey
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.add),
            color: Colors.black,

          )
        ],
      ),
    ),
  );
}
