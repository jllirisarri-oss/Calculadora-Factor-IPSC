import 'package:flutter/material.dart';
void main()=>runApp(const MaterialApp(debugShowCheckedModeBanner:false,home:Home()));
class Home extends StatefulWidget{const Home({super.key});@override State<Home> createState()=>_S();}
class _S extends State<Home>{bool f=true;double g=124,m=320,t=125;
double get fps=>m*3.28084; double get fac=>g*fps/1000; double get min=>((t*1000)/g)/3.28084;
@override Widget build(c)=>Scaffold(appBar:AppBar(title:const Text('Calculadora Factor IPSC')),body:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
Row(children:[Expanded(child:ElevatedButton(onPressed:()=>setState(()=>f=true),child:const Text('Factor'))),const SizedBox(width:8),Expanded(child:ElevatedButton(onPressed:()=>setState(()=>f=false),child:const Text('Velocitat')))]),const SizedBox(height:16),
TextField(decoration:const InputDecoration(labelText:'Pes (grains)',border:OutlineInputBorder()),onChanged:(v)=>setState(()=>g=double.tryParse(v)??g)),
const SizedBox(height:12),
if(f)...[TextField(decoration:const InputDecoration(labelText:'Velocitat (m/s)',border:OutlineInputBorder()),onChanged:(v)=>setState(()=>m=double.tryParse(v)??m)),const SizedBox(height:20),Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[const Text('Factor'),Text(fac.toStringAsFixed(1),style:const TextStyle(fontSize:42,fontWeight:FontWeight.bold)),Text(fps.toStringAsFixed(0)+' ft/s'),Icon(fac>=125?Icons.check_circle:Icons.cancel,color:fac>=125?Colors.green:Colors.red,size:44)])))]
else...[TextField(decoration:const InputDecoration(labelText:'Factor objectiu',border:OutlineInputBorder()),onChanged:(v)=>setState(()=>t=double.tryParse(v)??t)),const SizedBox(height:20),Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[const Text('Velocitat mínima'),Text(min.toStringAsFixed(1)+' m/s',style:const TextStyle(fontSize:36,fontWeight:FontWeight.bold)),Text((min*3.28084).toStringAsFixed(0)+' ft/s')])))] ])));} }
