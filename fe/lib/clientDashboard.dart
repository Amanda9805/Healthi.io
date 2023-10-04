import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart; // Import with a prefix
import 'package:syncfusion_flutter_charts/charts.dart' as sf_charts; // Import with a prefix



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<List<dynamic>> _adData = [];
  List<List<dynamic>> _data = [];
  Map<String,int> _numberOfUser={};
  Map<String, double> nationalityData = {};
  Map<String, double> genderMap = {};
  Map<String, double> advertData = {};


  @override
  void initState() {
    super.initState();
    loadCSV();
    loadAdvertDataCSV().then((statusData) {
      setState(() {
        advertData = statusData.cast<String, double>();
      });
    });
  }

  // Function to get nationalities
  Map<String, double> getNationalities(List<List<dynamic>> data) {
    Map<String, double> nationalityMap = {};

    for (int i = 1; i < data.length; i++) {
      String nationality = data[i][4].toString(); // Assuming "Nationality" is in the fifth column (index 4)

      if (nationalityMap.containsKey(nationality)) {
        nationalityMap[nationality] = nationalityMap[nationality]! + 1;
      } else {
        nationalityMap[nationality] = 1;
      }
    }

    return nationalityMap;
  }

  // Function to get genders
  Map<String, double> getGenders(List<List<dynamic>> data) {
    Map<String, double> genderMap = {};

    for (int i = 1; i < data.length; i++) {
      String gender = data[i][3].toString(); // Assuming "Gender" is in the fourth column (index 3)

      if (genderMap.containsKey(gender)) {
        genderMap[gender] = genderMap[gender]! + 1;
      } else {
        genderMap[gender] = 1;
      }
    }

    return genderMap;
  }

  // Function to load and process the AdvertData CSV file
  Future<Map<String, int>> loadAdvertDataCSV() async {
    final _rawData = await rootBundle.loadString("assets/AdvertData.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);

    // Extract the 'Status' column data
    List<String> statusData = _listData.skip(1).map((row) => row[2].toString()).toList();

    // Count the occurrences of each 'Status'
    Map<String, int> statusOccurrences = {};
    for (String status in statusData) {
      if (statusOccurrences.containsKey(status)) {
        statusOccurrences[status] = statusOccurrences[status]! + 1;
      } else {
        statusOccurrences[status] = 1;
      }
    }

    // Return the JSON object with 'Status' values and occurrences
    return statusOccurrences;
  }

  void loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/dummyUser.csv");
    List<List<dynamic>> _listData = const CsvToListConverter().convert(_rawData);
    setState(() {
      _data = _listData;
      nationalityData = getNationalities(_data);
      genderMap = getGenders(_data);
    });
  }

  Map<String,int> getNumberOfUsers(List<List<dynamic>> data)
  {
    Map<String, int> returnObj={};
    returnObj['number_of_users']=data.length;
    return returnObj;
  }

  Widget BuildNumberOfUsersTile(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 350,
        color: Color(0xFF6DFA60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                  _numberOfUser['number_of_users'].toString(),
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito'
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                  child:Text(
                      'Number of Users on the Platform',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito'
                      )
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }




  // Function to create a pie chart with advertData
  Widget buildAdvertDataPieChart() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 180, // Set the height of the container
          width: 370,
          color: const Color(0xF2474D5F),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "ADVERT DATA DISTRIBUTION",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: PieChart(
                      dataMap: advertData,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      legendOptions: LegendOptions(
                        showLegends: true,
                        legendPosition: pie_chart.LegendPosition.right,
                        showLegendsInRow: false,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: false,
                      ),
                      chartRadius: 100, // Set the chartRadius to adjust the size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNationalityGraph() {
    final List<MapEntry<String, double>> chartData = nationalityData.entries
        .toList();
    Widget buildNationalityGraph() {
      final List<MapEntry<String, double>> chartData = nationalityData.entries.toList();

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 220, // Adjust the height of the container to accommodate the graph
            width: 370,
            color: const Color(0xF2474D5F),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "NATIONALITY DISTRIBUTION",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),Expanded(
                    child: Container(
                      height: 160, // Adjust the height of the container to accommodate the graph
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(
                          labelStyle: TextStyle(
                            color: Colors.white, // Set the label text color to white
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          labelStyle: TextStyle(
                            color: Colors.white, // Set the label text color to white
                          ),
                        ),
                        legend: Legend(isVisible: false),
                        series: <ChartSeries<MapEntry<String, double>, String>>[
                          BarSeries<MapEntry<String, double>, String>(
                            dataSource: chartData,
                            xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
                            yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(
                                color: Colors.white, // Set the data label text color to white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

// Function to create a pie chart with advertData
    // Function to create a pie chart with advertData



    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 220,
          // Adjust the height of the container to accommodate the graph
          width: 370,
          color: const Color(0xF2474D5F),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "NATIONALITY DISTRIBUTION",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 160,
                    // Adjust the height of the container to accommodate the graph
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        labelStyle: TextStyle(
                          color: Colors
                              .white, // Set the label text color to white
                        ),
                      ),
                      primaryYAxis: NumericAxis(
                        labelStyle: TextStyle(
                          color: Colors
                              .white, // Set the label text color to white
                        ),
                      ),
                      legend: Legend(isVisible: false),
                      series: <ChartSeries<MapEntry<String, double>, String>>[
                        BarSeries<MapEntry<String, double>, String>(
                          dataSource: chartData,
                          xValueMapper: (MapEntry<String, double> entry,
                              _) => entry.key,
                          yValueMapper: (MapEntry<String, double> entry,
                              _) => entry.value,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                              color: Colors
                                  .white, // Set the data label text color to white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildGenderGraph() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 200, // Reduce the height of the container
          width: 370,
          color: const Color(0xF2474D5F),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "GENDER DISTRIBUTION",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120, // Reduce the height of the PieChart container
                    child: PieChart(
                      dataMap: genderMap,
                      animationDuration: Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      legendOptions: LegendOptions(
                        showLegends: true,
                        legendPosition: pie_chart.LegendPosition.right,
                        showLegendsInRow: false,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: false,
                      ),
                      chartRadius: 250,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                child: buildNationalityGraph(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                child: buildGenderGraph(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                child: buildAdvertDataPieChart(),
              ),
            ],
          ),
        )
    );
  }
}