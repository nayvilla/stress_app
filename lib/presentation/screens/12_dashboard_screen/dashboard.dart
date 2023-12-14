// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';
//import 'dart:math';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:riverpod_app/presentation/providers/providers.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:riverpod_app/config/router/app_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final helloWorld = ref.watch(holaMundoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Lógica para regresar
            ref.read(appRouterProvider).go('/');
          },
        ),
      ),
      body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
            child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),               
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(                      
                      child: Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          //color: Color.fromARGB(255, 245, 242, 242),
                        ),
                      ),                
                    ),
                  ], 
                ),
                const SizedBox(height: 15),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 160),
                      child: Text(
                    "Sensor - GSR",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      //color: Color.fromARGB(255, 245, 242, 242),
                    ),
                  ),
                    ),
                    ),
                  ], 
                ),
                const SizedBox(height: 10),
                //Text(helloWorld),
                RealTimeChart(),

                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para el botón "Siguiente", ir formulario
                            ref.read(appRouterProvider).go('/');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFde455f),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15), 
                            child: Text(
                              'Siguiente',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
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

// ignore: use_key_in_widget_constructors
class RealTimeChart extends StatefulWidget {
  @override
  _RealTimeChartState createState() => _RealTimeChartState();
}

class _RealTimeChartState extends State<RealTimeChart> {
  late List<ChartData> chartDataGSR;
  late List<ChartData> chartDataEMG;
  late Timer timer;
  double minValueGSR = 0.0;
  double maxValueGSR = 0.0;
  double averageValueGSR = 0.0;
  double minValueEMG = 0.0;
  double maxValueEMG = 0.0;
  double averageValueEMG = 0.0;

  @override
  void initState() {
    super.initState();
    chartDataGSR = List.generate(
      10,
      (index) => ChartData(x: index.toString(), y: 0.0), // Inicializa con valores predeterminados
    );

    chartDataEMG = List.generate(
      10,
      (index) => ChartData(x: index.toString(), y: 0.0), // Inicializa con valores predeterminados
    );

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateChartDataGSRFromServer(); // Actualiza los datos desde el servidor PHP
      _updateChartDataEMGFromServer();
    });
  }

  Future<void> _updateChartDataGSRFromServer() async {
    final response = await http.get(Uri.parse('https://stressappshirleybd.000webhostapp.com/gsr.php'));
    
    if (response.statusCode == 200) {
      // Analiza la respuesta JSON del servidor PHP. Ajusta según el formato real de tus datos.
      final List<dynamic> jsonData = json.decode(response.body);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
      setState(() {
        chartDataGSR.add(ChartData(x: DateTime.now().second.toString(), y: double.parse(jsonData.last['GSR'])));
        if (chartDataGSR.length > 10) {
          chartDataGSR.removeAt(0);
        }
        // Calcula el mínimo, máximo y promedio
            minValueGSR = chartDataGSR.map((data) => data.y).minOrNull ?? 0.0;
            maxValueGSR = chartDataGSR.map((data) => data.y).maxOrNull ?? 0.0;
            averageValueGSR = chartDataGSR.map((data) => data.y).average;
      });
      }
    } else {
      // Maneja el caso en que la solicitud no sea exitosa.
      //print('Error al obtener datos del servidor: ${response.statusCode}');
    }
  }

  Future<void> _updateChartDataEMGFromServer() async {
    final response = await http.get(Uri.parse('https://stressappshirleybd.000webhostapp.com/emg.php'));
    
    if (response.statusCode == 200) {
      // Analiza la respuesta JSON del servidor PHP. Ajusta según el formato real de tus datos.
      final List<dynamic> jsonData = json.decode(response.body);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
      setState(() {
        chartDataEMG.add(ChartData(x: DateTime.now().second.toString(), y: double.parse(jsonData.last['EMG'])));
        if (chartDataEMG.length > 10) {
          chartDataEMG.removeAt(0);
        }
        // Calcula el mínimo, máximo y promedio
            minValueEMG = chartDataEMG.map((data) => data.y).minOrNull ?? 0.0;
            maxValueEMG = chartDataEMG.map((data) => data.y).maxOrNull ?? 0.0;
            averageValueEMG = chartDataEMG.map((data) => data.y).average;
      });
      }
    } else {
      // Maneja el caso en que la solicitud no sea exitosa.
      //print('Error al obtener datos del servidor: ${response.statusCode}');
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 400,
        child: Column(
            children: [
              
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                        Expanded(
                                child: SfCartesianChart(
                                  series: <SplineAreaSeries<ChartData, String>>[
                                    SplineAreaSeries<ChartData, String>(
                                      dataSource: chartDataGSR,
                                      color: const Color.fromRGBO(192, 108, 132, 1),
                                      borderColor: const Color.fromARGB(255, 37, 227, 176), // Color de borde igual al color de la línea
                                      borderWidth: 2, // Ancho del borde
                                      xValueMapper: (ChartData data, _) => data.x,
                                      yValueMapper: (ChartData data, _) => data.y,
                                    ),
                                  ],
                                  primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Tiempo [s]')),
                                  primaryYAxis: NumericAxis(title: AxisTitle(text: 'Microsiemens [µS]')),
                                ),                  
                        ),
                        const SizedBox(height: 10), 
                  ],
              ),             
              
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFde455f),
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(5),  // Ajusta el margen entre las tarjetas
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Mínimo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          minValueGSR.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFde455f),
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Promedio',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          averageValueGSR.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFde455f),
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Máximo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          maxValueGSR.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            const SizedBox(height: 20),

            const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 160),
                              child: Text(
                            "Sensor - EMG",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              //color: Color.fromARGB(255, 245, 242, 242),
                            ),
                            ),
                      ),
                    ),
                    
                  ], 
                ),
                
            const SizedBox(height: 10),
            Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                        Expanded(
                                  child: SfCartesianChart(
                                    series: <SplineAreaSeries<ChartData, String>>[
                                      SplineAreaSeries<ChartData, String>(
                                        dataSource: chartDataEMG,
                                        color: const Color.fromARGB(255, 37, 227, 176),
                                        borderColor: const Color.fromRGBO(192, 108, 132, 1), // Color de borde igual al color de la línea
                                        borderWidth: 2, // Ancho del borde
                                        xValueMapper: (ChartData data, _) => data.x,
                                        yValueMapper: (ChartData data, _) => data.y,
                                      ),
                                    ],
                                    primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Tiempo [s]')),
                                    primaryYAxis: NumericAxis(title: AxisTitle(text: 'Microvoltios [µV]')),
                                  ),                  
                          ),   
              ], 
                ),           
              const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFde455f),
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(5),  // Ajusta el margen entre las tarjetas
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Mínimo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          minValueEMG.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFde455f),
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Promedio',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          averageValueEMG.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFde455f),
                          spreadRadius: 1,
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Máximo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          maxValueEMG.toStringAsFixed(2),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),  
              
        ]),
    //),
    );
  }
}

class ChartData {
  final String x;
  final double y;

  ChartData({required this.x, required this.y});
}

