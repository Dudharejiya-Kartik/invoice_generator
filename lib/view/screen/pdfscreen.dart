import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/variables.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as k;
import 'package:printing/printing.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      build: (format) => generatepdf(),
    );
  }
}

Future<Uint8List> generatepdf() async {
  final pdf = k.Document();
  var lato = await PdfGoogleFonts.latoBlack();

  pdf.addPage(k.Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) => k.Column(children: [
      k.Row(mainAxisAlignment: k.MainAxisAlignment.center, children: [
        k.Text("Supermarket", style: k.TextStyle(font: lato, fontSize: 30))
      ]),
      k.SizedBox(height: 25),
      k.Row(mainAxisAlignment: k.MainAxisAlignment.center, children: [
        k.Text("Invoice", style: k.TextStyle(font: lato, fontSize: 25))
      ]),
      k.SizedBox(height: 25),
      k.Row(mainAxisAlignment: k.MainAxisAlignment.center, children: [
        k.Text("167 ,near super complex, katargam , Surat",
            style: k.TextStyle(font: lato, fontSize: 18))
      ]),
      k.SizedBox(height: 25),
      k.Table(border: k.TableBorder.all(width: 2), children: [
        k.TableRow(children: [
          k.Text("Sr.",
              textAlign: k.TextAlign.center,
              style: k.TextStyle(font: lato, fontSize: 15)),
          k.Text("Product Name",
              textAlign: k.TextAlign.center,
              style: k.TextStyle(font: lato, fontSize: 15)),
          k.Text("Price",
              textAlign: k.TextAlign.center,
              style: k.TextStyle(font: lato, fontSize: 15)),
          k.Text("Quantity",
              textAlign: k.TextAlign.center,
              style: k.TextStyle(font: lato, fontSize: 15)),
        ]),
        ...List.generate(
          Products.length,
          (index) => k.TableRow(children: [
            k.Text("${index + 1}",
                textAlign: k.TextAlign.center,
                style: k.TextStyle(font: lato, fontSize: 15)),
            k.Text(Products[index]['productName'].text,
                textAlign: k.TextAlign.center,
                style: k.TextStyle(font: lato, fontSize: 15)),
            k.Text(Products[index]['productPrice'].text,
                textAlign: k.TextAlign.center,
                style: k.TextStyle(font: lato, fontSize: 15)),
            k.Text(Products[index]['productQuantity'].text,
                textAlign: k.TextAlign.center,
                style: k.TextStyle(font: lato, fontSize: 15)),
          ]),
        ),
        // r.TableRow(
        //
        //     children: [
        //   r.Text("599",
        //       textAlign: r.TextAlign.center,
        //       style: r.TextStyle(font: lato, fontSize: 15)),
        // ]),
      ]),
      k.Row(mainAxisAlignment: k.MainAxisAlignment.end, children: [
        k.Padding(
          padding: k.EdgeInsets.only(right: 20),
          child: k.Text("",
              textAlign: k.TextAlign.center,
              style: k.TextStyle(font: lato, fontSize: 15)),
        )
      ])
    ]),
  ));
  return await pdf.save();
}
