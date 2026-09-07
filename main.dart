
import 'package:flutter/material.dart';
void main()=>runApp(const IPSCApp());
class IPSCApp extends StatelessWidget{const IPSCApp({super.key});
  @override Widget build(BuildContext c)=>MaterialApp(debugShowCheckedModeBanner:false,theme:ThemeData.dark(),home:const Home());}
class Home extends StatefulWidget{const Home({super.key});@override State<Home> createState()=>_HomeState();}
class _HomeState extends State<Home>{
 bool factorMode=true; double grains=124, ms=320, target=125;
 double get fps=>ms*3.28084; double get factor=>grains*fps/1000; double get minMs=>((target*1000)/grains)/3.28084;
 @override Widget build(BuildContext c)=>Scaffold(
 appBar:AppBar(title:const Text("Calculadora Factor IPSC")),
 body:Padding(padding:const EdgeInsets.all(16),child:Column(children:[
   SegmentedButton<bool>(segments:const[
     ButtonSegment(value:true,label:Text("Factor")),
     ButtonSegment(value:false,label:Text("Velocitat"))],selected:{factorMode},onSelectionChanged:(s)=>setState(()=>factorMode=s.first)),
   const SizedBox(height:16),
   TextField(decoration:const InputDecoration(labelText:"Pes (grains)",border:OutlineInputBorder()),keyboardType:TextInputType.number,onChanged:(v)=>setState(()=>grains=double.tryParse(v)??grains)),
   const SizedBox(height:12),
   if(factorMode)...[
     TextField(decoration:const InputDecoration(labelText:"Velocitat (m/s)",border:OutlineInputBorder()),keyboardType:TextInputType.number,onChanged:(v)=>setState(()=>ms=double.tryParse(v)??ms)),
     const SizedBox(height:20),
     Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(children:[
       const Text("Factor",style:TextStyle(fontSize:20)),
       Text(factor.toStringAsFixed(1),style:const TextStyle(fontSize:46,fontWeight:FontWeight.bold)),
       Text("${fps.toStringAsFixed(0)} ft/s"),
       const SizedBox(height:10),
       Icon(factor>=125?Icons.check_circle:Icons.cancel,color:factor>=125?Colors.green:Colors.red,size:46)
     ])))
   ] else ...[
     TextField(decoration:const InputDecoration(labelText:"Factor objectiu",border:OutlineInputBorder()),keyboardType:TextInputType.number,onChanged:(v)=>setState(()=>target=double.tryParse(v)??target)),
     const SizedBox(height:20),
     Card(child:Padding(padding:const EdgeInsets.all(18),child:Column(children:[
       const Text("Velocitat mínima",style:TextStyle(fontSize:20)),
       Text("${minMs.toStringAsFixed(1)} m/s",style:const TextStyle(fontSize:38,fontWeight:FontWeight.bold)),
       Text("${(minMs*3.28084).toStringAsFixed(0)} ft/s")
     ])))
   ]
 ])));
