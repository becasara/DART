import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> perguntas = [
    {
      'pergunta': 'Onde Jesus nasceu?',
      'opcoes': ['Belém', 'Jerusalém', 'Nazaré'],
      'respostaCorreta': 'Belém',
    },
    {
      'pergunta': 'Quem batizou Jesus?',
      'opcoes': ['Pedro', 'João Batista', 'Moisés'],
      'respostaCorreta': 'João Batista',
    },
    {
      'pergunta': 'Quantos discípulos Jesus teve?',
      'opcoes': ['10', '12', '7'],
      'respostaCorreta': '12',
    },
    {
      'pergunta': 'Qual foi o primeiro milagre de Jesus?',
      'opcoes': ['Andar sobre as águas', 'Multiplicação dos pães', 'Transformar água em vinho'],
      'respostaCorreta': 'Transformar água em vinho',
    },
    {
      'pergunta': 'Em qual monte Jesus foi crucificado?',
      'opcoes': ['Monte das Oliveiras', 'Monte Sião', 'Gólgota'],
      'respostaCorreta': 'Gólgota',
    },
    {
      'pergunta': 'Quem negou Jesus três vezes?',
      'opcoes': ['Pedro', 'Tiago', 'João'],
      'respostaCorreta': 'Pedro',
    },
    {
      'pergunta': 'Quem traiu Jesus?',
      'opcoes': ['Judas', 'Pedro', 'João'],
      'respostaCorreta': 'Judas',
    },
    {
      'pergunta': 'Qual era o nome da mãe de Jesus?',
      'opcoes': ['Sara', 'Rebeca', 'Maria'],
      'respostaCorreta': 'Maria',
    },
    {
      'pergunta': 'Qual é o nome do pai de Jesus?',
      'opcoes': ['José', 'Tiago', 'Pedro'],
      'respostaCorreta': 'José',
    },
    {
      'pergunta': 'Qual foi o milagre de Jesus no casamento em Caná?',
      'opcoes': ['Multiplicação dos pães', 'Transformar água em vinho', 'Curar um cego'],
      'respostaCorreta': 'Transformar água em vinho',
    },
  ];
  
  final List<String> imagensPerguntas = [
  'https://images.pexels.com/photos/6244101/pexels-photo-6244101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',   // nascimento
  'https://images.pexels.com/photos/18793967/pexels-photo-18793967/free-photo-of-homem-igreja-capela-catedral.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',     // batismo
  'https://images.pexels.com/photos/27992035/pexels-photo-27992035/free-photo-of-pessoas-homens-mulheres-mexicano.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',     // discípulos
  'https://images.pexels.com/photos/30265338/pexels-photo-30265338/free-photo-of-flores-brancas-delicadas-em-foco-suave.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',     // água em vinho
  'https://images.pexels.com/photos/53959/summit-cross-peak-happiness-hochlantsch-mountain-53959.jpeg?auto=compress&cs=tinysrgb&w=600',  // crucificação
  'https://images.pexels.com/photos/8383656/pexels-photo-8383656.jpeg?auto=compress&cs=tinysrgb&w=600',   // Pedro nega
  'https://images.pexels.com/photos/8383650/pexels-photo-8383650.jpeg?auto=compress&cs=tinysrgb&w=600',   // Judas
  'https://images.pexels.com/photos/753561/pexels-photo-753561.jpeg?auto=compress&cs=tinysrgb&w=600',     // Maria
  'https://images.pexels.com/photos/1590046/pexels-photo-1590046.jpeg?auto=compress&cs=tinysrgb&w=600',   // José
  'https://images.pexels.com/photos/8383448/pexels-photo-8383448.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Casamento em Caná
];



  int perguntaAtual = 0;
  int pontos = 0;
  String? mensagem;
  String? imagemFeedback;
  bool quizFinalizado = false;

  void verificarResposta(String respostaEscolhida) {
    String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

    setState(() {
      if (respostaEscolhida == respostaCorreta) {
        pontos++;
        mensagem = 'Resposta certa, razô! +1';
        imagemFeedback = 'https://img.icons8.com/fluency/96/checked.png'; // Imagem para resposta correta
      } else {
        mensagem = 'Resposta errada, catapimbas!';
        imagemFeedback = 'https://img.icons8.com/fluency/96/cancel.png'; // Imagem para resposta errada
      }
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        mensagem = null;
        imagemFeedback = null;
        if (perguntaAtual < perguntas.length - 1) {
          perguntaAtual++;
        } else {
          quizFinalizado = true;
        }
      });
    });
  }

  void reiniciarQuiz() {
    setState(() {
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
      imagemFeedback = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[200],
        scaffoldBackgroundColor: Color(0xFFD6F1D3),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.black87,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz sobre Jesus'),
          backgroundColor: Colors.green[300],
        ),
        body: Center(
          child: quizFinalizado
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Parabéns! Você terminou o quiz!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Sua pontuação: $pontos/${perguntas.length}',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: reiniciarQuiz,
                      child: Text('Recomeçar'),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                     imagensPerguntas[perguntaAtual],
                     width: 200,
                     height: 150,
                     fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20),
                    Text(
                      perguntas[perguntaAtual]['pergunta'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20), // Letra do centro,após a imagem
                    ),
                    SizedBox(height: 20),
                    ...perguntas[perguntaAtual]['opcoes'].map<Widget>((opcao) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ElevatedButton(
                          onPressed: mensagem == null
                              ? () => verificarResposta(opcao)
                              : null,
                          child: Text(opcao),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20),
                    if (mensagem != null) ...[
                      if (imagemFeedback != null)
                        Image.network(imagemFeedback!, width: 64, height: 64),
                      SizedBox(height: 10),
                      Text(
                        mensagem!,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
