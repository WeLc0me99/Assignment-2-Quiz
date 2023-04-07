import 'package:flutter/material.dart';
import 'package:quiz_assignment/intro.dart';
import 'package:quiz_assignment/lists.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //const QuizScreen({Key? key}) : super(key: key);


  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
          const Text(
              "Quiz 1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
             _questionWidget(),
             _answerList(),
             _next(),
          ],
        ),
      ),
    );
  }


  _questionWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Question ${currentQuestionIndex+1}/${questionList.length.toString()} \nNOTE: BECAREFUL IF YOU CHOOSE ANSWER YOU CAN'T CHANGE IT. GOOD LUCK:)",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  _answerList(){
    return Column(
      children: questionList[currentQuestionIndex].answersList.map(
          (e) => _answerButton(e),
      )
          .toList(),
    );
  }
   Widget _answerButton(Answer answer){

    bool isSelected = answer==selectedAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: isSelected ? Colors.cyan : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {

          if(selectedAnswer == null){
            if(answer.isCorrect){
              score++;
            }
            setState(() {
              selectedAnswer = answer;

            });
          }



        },
      ),
    );
   }

   _next(){

    bool isLastQuestion = false;
    if(currentQuestionIndex == questionList.length-1){
      isLastQuestion = true;
    }

     return Container(
       width: MediaQuery.of(context).size.width * 0.5,
       height: 48,
       child: ElevatedButton(
         child: Text(isLastQuestion ? "Submit" : "Next"),
         style: ElevatedButton.styleFrom(
           shape: const StadiumBorder(),
           primary:  Colors.cyan,
           onPrimary: Colors.white,
         ),
         onPressed: () {

           if(isLastQuestion){

             showDialog(context: context, builder: (_)=> _showScore());

           }else{
             setState(() {
               selectedAnswer = null;
               currentQuestionIndex++;
             });
           }


         },
       ),
     );
   }

   _showScore(){
    bool isPassed = false;

    if(score >= questionList.length *0.5){
      isPassed = true;
    }
    String title = isPassed?"Passed" : "Failed";

    return AlertDialog(
      title: Text(title + "\nYour Score is $score /8\n The Answers(C,C,C,D.A,A,B,A,C)",style: TextStyle(

          color: isPassed?Colors.green:Colors.red
      ),
      ),
      content: ElevatedButton(child: Text("Home Page"),onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LogIn()));
        setState(() {
          currentQuestionIndex = 0;
          score = 0;
          selectedAnswer = null;
        });
      },
      ),
    );
   }
}

