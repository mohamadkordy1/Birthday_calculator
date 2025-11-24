

import 'package:flutter/material.dart';


class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

DateTime now=DateTime.now();
int year=-1;
int month=-1;
int day=-1;


class _homeState extends State<home> {


  bool showResult=false;
  String text="";
  String text1="";
  String text2="";

  int totaldays=0;
  int totalminutes=0;
  int totalsec=0;
  int totalhours=0;
  int totalweek=0;
  int leftdays=0;
  int totalmonths=0;
void updateText(){
  setState(() {
    showResult=true;
    if(year==-1||month==-1||day==-1){
      text="please fill the fields ";
    }else{
      int year1=now.year-year;
      int month1=now.month-month;
      int day1=now.day-day;


      if(month1<0){
        year1-=1;
        month1+=12;
      } if(day1<0){
        month1 -= 1;
        int prevMonthDays = DateTime(now.year, now.month, 0).day;
        day1 += prevMonthDays;
      }
if(month1==0 && day1==0){
  text2="Happy Birthday";
}else{
DateTime nextbirthday=DateTime(now.year,month,day);

if(!nextbirthday.isAfter(now)){
  nextbirthday =DateTime(now.year+1,month,day);

}

Duration diff =nextbirthday.difference(now);

int month2=diff.inDays~/30;
int day2=diff.inDays%30;

  text2="Time until you next birthday is approximately : $month2 months and $day2 day ";
}

      DateTime birthday=DateTime(year,month,day);
      Duration differance=now.difference(birthday);


      totaldays=differance.inDays;
      totalhours=differance.inHours;
      totalminutes=differance.inMinutes;
      totalsec=differance.inSeconds;
      totalweek=(totaldays/7).toInt();
      leftdays=totaldays%7;
      totalmonths=(year1*12)+month1;
      text="Your age is $year1 Year $month1 Month and $day1 Day";
      text1=""
          "\nYou have lived  $totalmonths months and $day1 days"
          "\nOR $totalweek weeks and $leftdays days"
          ""
          "\nOR $totaldays Days"
          "\nOR $totalhours Hours"
          "\nOR $totalminutes Minutes"
          "\nOR $totalsec second"
      "    \n\n \n We wish you a beautiful life , \nFull of joy and happiness";;
    }
  });
}
  void updateyear(value){
    if (value.trim() == '') {
      year = -1;
    }
    else {
      year = int.parse(value);
    }
  }
  void updatemonth(value){
    if (value.trim() == '') {
      month = -1;
    }
    else {
      month = int.parse(value);
    }
  }

  void updateday(value){
    if (value.trim() == '') {
      day = -1;
    }
    else {
      day = int.parse(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title:Center(child: Text("  Birthday calculator " ,)),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                const SizedBox(height: 20),

                Text(
                  "Enter your birthday",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Year",
                                    border: OutlineInputBorder()),
                                onChanged: updateyear,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Month",
                                    border: OutlineInputBorder()),
                                onChanged: updatemonth,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Day",
                                    border: OutlineInputBorder()),
                                onChanged: updateday,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: updateText,
                          child: Text(
                            "Calculate",
                            style: TextStyle(fontSize: 18,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                if(showResult)...[

                const SizedBox(height: 30),

                Text(
                  "The Result:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "$text\n\n$text2\n\n$text1",
                      style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,),
                  ),
                ),
                ],
              ],
            ),
          ),
        ),
      ),


    );
  }
}

class TextFeild extends StatelessWidget {

  Function (String)f;
  String hint;
   TextFeild({
    required this.f,
    required this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(decoration: InputDecoration(border: OutlineInputBorder(),hintText: hint)
      ,onChanged: (value){
      f(value);
      },);
  }
}
