
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/result_provider.dart';
import 'package:riverpod_app/config/router/app_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartDataReport {
  final Color color;
  final String name;
  final int age;

  ChartDataReport(this.color, this.name, this.age);
}

class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final username = ref.read(usernameControllerProvider);
    final resultadoConsulta = ref.watch(cargarResultProvider);

    int total = 0;
    int estresBajo = 0;
    int estresModerado = 0;
    int estresAlto = 0;
    List<Map<String, dynamic>> dataList = [];

    if (resultadoConsulta.value != null && resultadoConsulta.value!.isNotEmpty) {
  // Convierte la cadena JSON a un mapa de Dart
  final Map<String, dynamic> datos = jsonDecode(resultadoConsulta.value ?? '');

  // Obtén variables
  total = datos["total"] ?? 0;
  estresBajo = datos["estresbajo"] ?? 0;
  estresModerado = datos["estresmoderado"] ?? 0;
  estresAlto = datos["estresalto"] ?? 0;

  // Obtén lista de resultados
  final List<dynamic> resultados = datos["resultados"] ?? [];
  dataList = resultados.asMap().entries.map((entry) {
    final int index = entry.key + 1; // Suma 1 al índice para empezar desde 1
    final Map<String, dynamic> result = entry.value;

    return {
      'ID': index,
      'EMG': '${result['emg'] ?? ""}',
      'GSR': '${result['gsr'] ?? ""}',
      'Resultado': '${result['estres'] ?? ""}',
    };
  }).toList();
}
 else {
        total = 0;
        estresBajo = 0;
        estresModerado = 0;
        estresAlto = 0;
        dataList = [];
      }

    Widget buildChart() {
  return Expanded(
    child: SfCircularChart(
      series: <CircularSeries>[
        DoughnutSeries<ChartDataReport, String>(
          dataSource: [
            // Mantén tus datos originales aquí
            ChartDataReport(Colors.greenAccent, 'hi', estresBajo),
            ChartDataReport(Colors.blueAccent, 'to', estresModerado),
            ChartDataReport(Colors.redAccent, 'yo', estresAlto),
          ],
          pointColorMapper: (ChartDataReport data, _) => data.color,
          xValueMapper: (ChartDataReport data, _) => data.name,
          yValueMapper: (ChartDataReport data, _) => data.age,
          radius: '80%',       // Ajusta el radio para que la gráfica ocupe todo el espacio disponible
          innerRadius: '55%',   // Ajusta el radio interno para crear el efecto de rosquilla
          // Personalización de las etiquetas de datos
          dataLabelSettings: const DataLabelSettings(
            isVisible: true, // Para mostrar las etiquetas
            labelPosition: ChartDataLabelPosition.outside, // Posiciona las etiquetas fuera de la gráfica
            textStyle: TextStyle(color: Colors.black, fontSize: 10),
          ),
        ),
      ],
      // Agregar aquí cualquier configuración adicional del gráfico circular
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          // ignore: avoid_unnecessary_containers
          widget: Container(
            child: Text(
              'Total\n$total', // Suma de tus datos para mostrar en el centro
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

    Widget buildReportChart() {
      return Padding( padding: const EdgeInsets.only(left: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
          
        ),
        //child: Padding( padding: const EdgeInsets.only(left: 15),
          child: Container(
            height: MediaQuery.of(context).size.height * .40,
            width: MediaQuery.of(context).size.width * .55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Resultados de Estres",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                const Divider( 
                  color: Color.fromARGB(255, 202, 200, 200),
                  thickness: 0.3,
                  endIndent: 10,
                  indent: 10,
                ),
                buildChart(),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildInfoWidget(String title, String value) {
      return SizedBox(
        width: 115.0,
        child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),),
      );
    }
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Regresar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(appRouterProvider).go('/');
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "Historial de Consultas",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    buildReportChart(),
                    const SizedBox(height: 20),
                    Padding(padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      children: [
                        buildInfoWidget('Alto', '$estresAlto'),
                        const SizedBox(height: 20),
                        buildInfoWidget('Moderado', '$estresModerado'),
                        const SizedBox(height: 20),
                        buildInfoWidget('Bajo', '$estresBajo'),
                      ],
                    ),),
                    

                  ],
                ),
                const SizedBox(height: 20),
                PaginatedDataTableWidget(
                  data: dataList,
                  rowsPerPage: 10,
                ),
         
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PaginatedDataTableWidget extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final int rowsPerPage;

  const PaginatedDataTableWidget({
    Key? key,
    required this.data,
    this.rowsPerPage = 10,
  }) : super(key: key);

  @override
  _PaginatedDataTableWidgetState createState() => _PaginatedDataTableWidgetState();
}

class _PaginatedDataTableWidgetState extends State<PaginatedDataTableWidget> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int totalPages = (widget.data.length / widget.rowsPerPage).ceil();

    List<DataRow> _getCurrentPageRows() {
      int startIndex = currentPage * widget.rowsPerPage;
      int endIndex = startIndex + widget.rowsPerPage;
      if (endIndex > widget.data.length) {
        endIndex = widget.data.length;
      }
      return widget.data.sublist(startIndex, endIndex).map((dataItem) {
        return DataRow(cells: [
          DataCell(Text(dataItem['ID'].toString())),
          DataCell(Text(dataItem['EMG'])),
          DataCell(Text(dataItem['GSR'])),
          DataCell(Text(dataItem['Resultado'])),
        ]);
      }).toList();
    }

    List<DataRow> currentRows = _getCurrentPageRows();

    return Padding(
     padding: const EdgeInsets.only(left: 20, right: 14),
    child: Container(
                 padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(15),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 5,
                       blurRadius: 7,
                       offset: const Offset(0, 3), // changes position of shadow
                     ),
                   ],
                 ),
    child: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('EMG')),
              DataColumn(label: Text('GSR')),
              DataColumn(label: Text('Resultado')),
            ],
            rows: currentRows,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: currentPage > 0
                  ? () {
                      setState(() {
                        currentPage--;
                      });
                    }
                  : null,
            ),
            Text('Página ${currentPage + 1} de $totalPages'),
            IconButton(
              icon: Icon(Icons.chevron_right),
              onPressed: currentPage < totalPages - 1
                  ? () {
                      setState(() {
                        currentPage++;
                      });
                    }
                  : null,
            ),
          ],
        ),
      ],
    ),),);
  }
}
