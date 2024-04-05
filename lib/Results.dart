import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class Results extends StatelessWidget {
  final int nValue;
  final double xsum;
  final double ysum;
  final double XYsum;
  final double Xsquaredsum;
  final double Ysquaredsum;

  const Results(
      {super.key,
      required this.xsum,
      required this.ysum,
      required this.XYsum,
      required this.Xsquaredsum,
      required this.Ysquaredsum,
      required this.nValue});

  double correlationCoefficient() {
    int n = nValue;
    double r = ((n * XYsum) - (xsum * ysum)) /
        (sqrt((n * Xsquaredsum - pow(xsum, 2)) *
            (n * Ysquaredsum - pow(ysum, 2))));
    return r;
  }

  Text measureCorrelation() {
    double r = correlationCoefficient();
    if (r > 0.8) {
      return const Text(
        'Perfect Positive Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 46, 251, 0),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > 0.6) {
      return const Text(
        'Strong Positive Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 101, 255, 91),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > 0.4) {
      return const Text(
        'Moderate Positive Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 144, 253, 129),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > 0.2) {
      return const Text(
        'Weak Positive Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 193, 248, 187),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > 0) {
      return const Text(
        'No Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > -0.2) {
      return const Text(
        'Very Weak Negative Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 255, 229, 229),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > -0.4) {
      return const Text(
        'Weak Negative Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 255, 180, 180),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > -0.6) {
      return const Text(
        'Moderate Negative Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 250, 105, 105),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (r > -0.8) {
      return const Text(
        'Strong Negative Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 250, 55, 55),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    } else {
      return const Text(
        'Perfect Negative Correlation',
        style: TextStyle(
          fontFamily: 'Outfit',
          color: Color.fromARGB(255, 255, 0, 0),
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
        ),
      );
    }
  }

  Color getCorrelationColor() {
    double r = correlationCoefficient();
    if (r > 0.8) {
      return const Color.fromARGB(255, 46, 251, 0);
    } else if (r > 0.6) {
      return const Color.fromARGB(255, 101, 255, 91);
    } else if (r > 0.4) {
      return const Color.fromARGB(255, 144, 253, 129);
    } else if (r > 0.2) {
      return const Color.fromARGB(255, 193, 248, 187);
    } else if (r > 0) {
      return const Color.fromARGB(255, 255, 255, 255);
    } else if (r > -0.2) {
      return const Color.fromARGB(255, 255, 229, 229);
    } else if (r > -0.4) {
      return const Color.fromARGB(255, 255, 180, 180);
    } else if (r > -0.6) {
      return const Color.fromARGB(255, 250, 105, 105);
    } else if (r > -0.8) {
      return const Color.fromARGB(255, 250, 55, 55);
    } else {
      return const Color.fromARGB(255, 255, 0, 0);
    }
  }

  double normalize(double value) {
    return (value + 1.0) / 2.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4B39EF),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x23000000),
                            offset: Offset(
                              0.0,
                              2,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Correlation Coefficient',
                                    style: TextStyle(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 24,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  measureCorrelation(),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator(
                                      value: normalize(correlationCoefficient()),
                                      strokeWidth: 8,
                                      backgroundColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          getCorrelationColor()),
                                      semanticsLabel: 'Linear progress indicator',
                                      semanticsValue: '50',
                                    ),
                                  ),
                                ),
                                Text(
                                  correlationCoefficient().toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 24,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: 320,
                        height: 140,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x4B1A1F24),
                              offset: Offset(
                                0.0,
                                2,
                              ),
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEE8B60), Color(0xFF4B39EF)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0.94, -1),
                            end: AlignmentDirectional(-0.94, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Sum of X',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                xsum.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 32,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: 320,
                        height: 140,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x4B1A1F24),
                              offset: Offset(
                                0.0,
                                2,
                              ),
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEE8B60), Color(0xFF4B39EF)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0.94, -1),
                            end: AlignmentDirectional(-0.94, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Sum of Y',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                ysum.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 32,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          width: 320,
                          height: 140,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x4B1A1F24),
                                offset: Offset(
                                  0.0,
                                  2,
                                ),
                              )
                            ],
                            gradient: const LinearGradient(
                              colors: [Color(0xFFEE8B60), Color(0xFF4B39EF)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0.94, -1),
                              end: AlignmentDirectional(-0.94, 1),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                  'Sum of XY',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 24,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  XYsum.toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 32,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: 320,
                        height: 140,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x4B1A1F24),
                              offset: Offset(
                                0.0,
                                2,
                              ),
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEE8B60), Color(0xFF4B39EF)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0.94, -1),
                            end: AlignmentDirectional(-0.94, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Squared Sum of Y',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                Ysquaredsum.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 32,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        width: 320,
                        height: 140,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x4B1A1F24),
                              offset: Offset(
                                0.0,
                                2,
                              ),
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEE8B60), Color(0xFF4B39EF)],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0.94, -1),
                            end: AlignmentDirectional(-0.94, 1),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'Squared Sum of X',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                Xsquaredsum.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                  fontSize: 32,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    width: 50,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
