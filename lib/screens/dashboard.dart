import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../buttons/roundedbuttons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  // Future getData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var responseJson = sharedPreferences.getString('response');
  // }

  String userName = 'User';
  String teamId = '';
  String teamName = '';
  String problem = '';

  List<String> memberList = [
    'Member 1',
    'Member 2',
    'Member 3',
    'Member 4',
    'Member 5',
  ];

  // String? userName = getData.responseJson!['uName'];
  // String? teamId = getData.responseJson['tid'];
  // String teamName = getData.responseJson['tName'];
  // String? problem = getData.responseJson['probStatement'];
  // List<String> memberList = [
  //   getData.responseJson['m1Name'],
  //   getData.responseJson['m2Name'],
  //   getData.responseJson['m3Name'],
  //   getData.responseJson['m4Name'],
  //   getData.responseJson['m5Name'],
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(16, 15, 15, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          bottom: 30.0, top: 15.0, left: 8.0, right: 8.0),
                      child: SizedBox(
                        height: 41,
                        child: Icon(
                          Icons.groups,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      teamName,
                      // teamName:'Team Name',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      'Team ID',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Table Number ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: RoundedButtonWidget(
                          width: MediaQuery.of(context).size.width * 0.1,
                          onpressed: () {},
                          buttonText: teamId != null ? teamId : '1',
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: RoundedButtonWidget(
                          width: MediaQuery.of(context).size.width * 0.1,
                          onpressed: () {},
                          buttonText: ' 2 ',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40.0),
                  child: Column(
                    children: [
                      RoundedButtonWidget(
                        width: MediaQuery.of(context).size.width * 0.8,
                        onpressed: () {},
                        buttonText: userName!=null?userName:'User',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedButtonWidget(
                        width: MediaQuery.of(context).size.width * 0.8,
                        onpressed: () {},
                        buttonText: memberList[0]!=null?memberList[0]:'memeber 1',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedButtonWidget(
                        width: MediaQuery.of(context).size.width * 0.8,
                        onpressed: () {},
                        buttonText: memberList[1]!=null?memberList[1]:'memeber 2',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedButtonWidget(
                        width: MediaQuery.of(context).size.width * 0.8,
                        onpressed: () {},
                        buttonText: memberList[2]!=null?memberList[2]:'memeber 3',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedButtonWidget(
                        width: MediaQuery.of(context).size.width * 0.8,
                        onpressed: () {},
                        buttonText: memberList[3]!=null?memberList[3]:'memeber 4',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const Text(
                      'Problem Statement',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: const Color.fromRGBO(16, 15, 15, 1),
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          problem!=null?problem:'Problem Statement',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
