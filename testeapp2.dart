// import 'package:flutter/material.dart';
// void main(){
//   runApp(myApp());
// }
// //StatelessWidget não muda estado
// //Avaliação 10 perguntas de perguntas e respostas
// class myApp extends StatefulWidget{ //Criamos a classe do app 
//   @override
//   _myAppState createState() => _myAppState();  //=> É a função return em seu formato reduzido
// }

// class _myAppState extends State<myApp>{
//   final List<Map<String, dynamic>>perguntas = [
//     {
//     'pergunta': 'Qual é a capital do Brasil?',
//     'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro'],
//     'respostaCorreta': 'Brasília',
//     },
//   ];
//   int perguntaAtual = 0; //Esse bloco inicializa os valores do quiz, tudo dentro da classe myAppState
//   int pontos = 0;
//   String? mensagem;
//   bool quizFinalizado = false;
//   //Função que verifica resposta, vai receber como parametro a resposta escolhida e vai colocar como parãmetro, fazendo uma comparação dentro do if.
//   void verificarResposta (String respostaEscolhida){
//     String respostaCorreta = perguntas[perguntaAtual] ['respostaCorreta'] ;
//     setState ((){
//       if (respostaEscolhida == respostaCorreta){
//         pontos ++;
//         mensagem ='Resposta certa, razô! +1';

//       }else{
//         mensagem = 'Resposta errada, catapimbas!';
//       }
//     });
    
//   }
//   //Espera 2 segundos e passa para a  próxima pergunta
//   Future.delayad(Duration(seconds:2)), (){
//     setState((){
//       mensagem = null;
//       if( perguntaAtual < perguntas.length - 1){
//         perguntaAtual ++ ;
        
//       }else{
//         quizFinalizado = true;
//       }
//     });
//   }
// // Último bloco a lógica a seguir:
// // Método para reiniciar o quiz
// //Devemos adicionar mais perguntas, as variáveis podemos deixar do jeito que tá, podemos alterar quantos pontos e a quantidade de segundos pra cada resposta e pra finalizar:
// // A manhã dia 10/04 vamos criar uma interface personalizada, devemo mudar  apersonalização de or, tipo de fonte, a logo que vamos criar no quiz...
//   void reiniciarQuiz(){
//     setState(() {
//       perguntaAtual = 0;
//       pontos =0;
//       quizFinalizado = false;
//       mensagem = null;
    
//     });
//   }
//   }
//   @override
//   Widget build (BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark() ,
//       darkTheme: ThemeData.dark(),
//       home: Scaffold(
//         appBar: AppBar(title: Text('Meu app massa :)'),),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center, ///Método que permite que todos os elementos da coluna estejam devidamente alinhados no eixo x e na vertical.
//             children: [ //SizedBox é o espaço entre um elemento e outro
//               SizedBox(height: 20),
//               Text(texto, style: TextStyle(fontSize: 250, color: const Color.fromARGB(255, 245, 48, 255)),), 
//               SizedBox(height: 50),
//               ElevatedButton(
//                 onPressed: alterarTexto,
//                 child: Text('Aperte-me', style: TextStyle(fontSize: 200, color: Colors.pinkAccent), ),
//               )
//             ], 
//           ),
//         ),
//       ), // Função que vai colocar o app bar e o body, (Scaffold)
//     );
//   }
// }