# **Análise Detalhada do Código do Quiz sobre Jesus em Flutter**  

Vou explicar **linha por linha** e **elemento por elemento** do código, detalhando cada parte para facilitar o entendimento.  

---

## **1. Importação de Bibliotecas**  
```dart
import 'package:flutter/material.dart';
```
- **`import`**: Usado para incluir bibliotecas necessárias.  
- **`package:flutter/material.dart`**: Biblioteca principal do Flutter que contém widgets e ferramentas para criar interfaces no estilo Material Design.  

---

## **2. Função Principal (`main`)**  
```dart
void main() {
  runApp(MyApp());
}
```
- **`void main()`**: Ponto de entrada do aplicativo (obrigatório em Dart).  
- **`runApp(MyApp())`**: Inicia o app Flutter e define `MyApp` como o widget raiz.  

---

## **3. Widget `MyApp` (StatefulWidget)**  
```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
```
- **`class MyApp extends StatefulWidget`**: Define um widget que pode mudar de estado (`StatefulWidget`).  
- **`@override`**: Indica que o método está sobrescrevendo um método da classe pai.  
- **`createState()`**: Método que cria e retorna o estado (`_MyAppState`) associado a este widget.  

---

## **4. Estado do Aplicativo (`_MyAppState`)**  
### **4.1. Lista de Perguntas (`perguntas`)**  
```dart
final List<Map<String, dynamic>> perguntas = [
  {
    'pergunta': 'Onde Jesus nasceu?',
    'opcoes': ['Belém', 'Jerusalém', 'Nazaré'],
    'respostaCorreta': 'Belém',
  },
  // ... outras perguntas
];
```
- **`final`**: Indica que a variável não pode ser alterada após sua inicialização.  
- **`List<Map<String, dynamic>>`**: Uma lista (`List`) de maps (`Map`), onde cada map tem:  
  - `'pergunta'` (String): Texto da pergunta.  
  - `'opcoes'` (List<String>): Lista de opções de resposta.  
  - `'respostaCorreta'` (String): Resposta correta.  

### **4.2. Lista de Imagens (`imagensPerguntas`)**  
```dart
final List<String> imagensPerguntas = [
  'https://...', // Imagem para pergunta 1
  // ... outras imagens
];
```
- **`List<String>`**: Lista de URLs de imagens correspondentes a cada pergunta.  

### **4.3. Variáveis de Estado**  
```dart
int perguntaAtual = 0;       // Índice da pergunta atual (começa em 0)
int pontos = 0;              // Pontuação do jogador
String? mensagem;            // Mensagem de feedback (pode ser nula)
String? imagemFeedback;      // Imagem de feedback (pode ser nula)
bool quizFinalizado = false; // Indica se o quiz terminou
```
- **`int`**: Tipo para números inteiros.  
- **`String?`**: `String` que pode ser `null` (nullable).  
- **`bool`**: Tipo booleano (`true`/`false`).  

---

## **5. Função `verificarResposta`**  
```dart
void verificarResposta(String respostaEscolhida) {
  String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

  setState(() {
    if (respostaEscolhida == respostaCorreta) {
      pontos++; // Incrementa pontuação se acertar
      mensagem = 'Resposta certa, razô! +1';
      imagemFeedback = 'https://...checked.png'; // Imagem de acerto
    } else {
      mensagem = 'Resposta errada, catapimbas!';
      imagemFeedback = 'https://...cancel.png'; // Imagem de erro
    }
  });

  Future.delayed(Duration(seconds: 2), () {
    setState(() {
      mensagem = null;
      imagemFeedback = null;
      if (perguntaAtual < perguntas.length - 1) {
        perguntaAtual++; // Vai para próxima pergunta
      } else {
        quizFinalizado = true; // Finaliza o quiz
      }
    });
  });
}
```
### **Explicação Detalhada**  
1. **`verificarResposta(String respostaEscolhida)`**:  
   - Recebe a resposta selecionada pelo usuário.  
2. **`respostaCorreta = perguntas[perguntaAtual]['respostaCorreta']`**:  
   - Pega a resposta correta da pergunta atual.  
3. **`setState(() { ... })`**:  
   - Atualiza o estado do widget (muda a UI).  
4. **`if (respostaEscolhida == respostaCorreta)`**:  
   - Verifica se a resposta está correta.  
   - Se sim:  
     - `pontos++`: Adiciona 1 ponto.  
     - Define `mensagem` e `imagemFeedback` para acerto.  
   - Se não:  
     - Define `mensagem` e `imagemFeedback` para erro.  
5. **`Future.delayed(Duration(seconds: 2), () { ... })`**:  
   - Espera 2 segundos antes de:  
     - Limpar `mensagem` e `imagemFeedback`.  
     - Ir para próxima pergunta ou finalizar o quiz.  

---

## **6. Função `reiniciarQuiz`**  
```dart
void reiniciarQuiz() {
  setState(() {
    perguntaAtual = 0;      // Volta para a primeira pergunta
    pontos = 0;             // Zera a pontuação
    quizFinalizado = false;  // Reinicia o quiz
    mensagem = null;        // Limpa mensagem
    imagemFeedback = null;  // Limpa imagem de feedback
  });
}
```
- **`reiniciarQuiz()`**:  
  - Reseta todas as variáveis de estado para reiniciar o quiz.  

---

## **7. Construção da Interface (`build`)**  
### **7.1. Configuração do `MaterialApp`**  
```dart
return MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.green[200],
    scaffoldBackgroundColor: Color(0xFFD6F1D3),
    textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black87)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.black87,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  home: Scaffold(...),
);
```
- **`MaterialApp`**: Widget raiz que define o tema e a navegação.  
- **`theme`**: Define cores e estilos globais.  
- **`home: Scaffold(...)`**: Tela principal do app.  

### **7.2. `Scaffold` (Estrutura da Tela)**  
```dart
home: Scaffold(
  appBar: AppBar(
    title: Text('Quiz sobre Jesus'),
    backgroundColor: Colors.green[300],
  ),
  body: Center(...),
),
```
- **`Scaffold`**: Fornece uma estrutura básica de layout (AppBar, Body, etc.).  
- **`AppBar`**: Barra superior com título e cor de fundo.  
- **`body: Center(...)`**: Centraliza o conteúdo.  

### **7.3. Lógica do Quiz na UI**  
```dart
body: Center(
  child: quizFinalizado
    ? Column( // Tela de finalização
        children: [
          Text('Parabéns! Você terminou o quiz!'),
          Text('Sua pontuação: $pontos/${perguntas.length}'),
          ElevatedButton(onPressed: reiniciarQuiz, child: Text('Recomeçar')),
        ],
      )
    : Column( // Tela do quiz em andamento
        children: [
          Image.network(imagensPerguntas[perguntaAtual], width: 200, height: 150),
          Text(perguntas[perguntaAtual]['pergunta']),
          ...perguntas[perguntaAtual]['opcoes'].map((opcao) => 
            ElevatedButton(
              onPressed: () => verificarResposta(opcao),
              child: Text(opcao),
            ),
          ),
          if (mensagem != null) ...[
            Image.network(imagemFeedback!, width: 64, height: 64),
            Text(mensagem!),
          ],
        ],
      ),
),
```
#### **Explicação Detalhada**  
1. **`quizFinalizado ? ... : ...`**:  
   - Se `quizFinalizado == true`, mostra a tela de resultados.  
   - Senão, mostra a pergunta atual.  
2. **Tela de Finalização (`quizFinalizado == true`)**:
   - Exibe mensagem de parabéns.  
   - Mostra pontuação (`$pontos/${perguntas.length}`).  
   - Botão **"Recomeçar"** que chama `reiniciarQuiz()`.  
3. **Tela do Quiz (`quizFinalizado == false`)**:
   - **`Image.network`**: Exibe a imagem da pergunta atual.  
   - **`Text(perguntas[perguntaAtual]['pergunta'])`**: Mostra o texto da pergunta.  
   - **`...perguntas[perguntaAtual]['opcoes'].map(...)`**:  
     - Cria um botão para cada opção de resposta.  
     - Quando clicado, chama `verificarResposta(opcao)`.  
   - **`if (mensagem != null)`**:  
     - Se houver feedback (`mensagem`), mostra a imagem e o texto.  

---

## **Conclusão**  
Este código implementa um **quiz interativo** com:  
✅ **Perguntas e respostas** (armazenadas em uma lista).  
✅ **Imagens para cada pergunta**.  
✅ **Feedback visual** (imagens e mensagens).  
✅ **Pontuação e reinicialização**.  
✅ **UI responsiva** com `MaterialApp`, `Scaffold`, `Column`, `ElevatedButton`, etc.  

É um **exemplo completo** de um app Flutter com **gerenciamento de estado** e **interface interativa**. 🚀
