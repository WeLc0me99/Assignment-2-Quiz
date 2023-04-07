


class Question{

  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);

}

class Answer{
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion(){
  List<Question> list = [];

  list.add(
    Question("Which of the following is not a type of network topology?",
      [
        Answer("A-Bus", false),
        Answer("B-Star", false),
        Answer("C-Square", true),
        Answer("D-Ring", false),

      ]),
  );

  list.add(
    Question("Which protocol is used for file sharing on a network?",
        [
          Answer("A-HTTP", false),
          Answer("B-SMTP", false),
          Answer("C-FTP", true),
          Answer("D-DNS", false),

        ]),
  );

  list.add(
    Question("Which layer of the OSI model is responsible for establishing, managing, and terminating connections between applications?",
        [
          Answer("A-Transport layer", false),
          Answer("B-Network layer", false),
          Answer("C-Application layer", false),
          Answer("D-Session layer", true),

        ]),
  );
  list.add(
      Question("The MAC address of a device can be changed by the user to hide their identity on the network.",
          [

            Answer("A-True", true),
            Answer("B-False", false),

          ]),
  );
  list.add(
    Question("Which type of network allows users to access resources and services from any location?",
        [
          Answer("A-Wide area network (WAN)", true),
          Answer("B-Local area network (LAN)", false),
          Answer("C-Wireless network", false),
          Answer("D-Session layer", false),

        ]),
  );

  list.add(
    Question("What is the maximum number of IP addresses that can be assigned to devices on a single subnet with a subnet mask of 255.255.255.0?",
        [
          Answer("A-255", false),
          Answer("B-254", true),
          Answer("C-256", false),
          Answer("D-512", false),

        ]),
  );list.add(
    Question("A router is a device that connects multiple networks and forwards data packets between them.",
        [

          Answer("A-True", true),
          Answer("B-False", false),

        ]),
  );list.add(
    Question("Which protocol is used to assign IP addresses automatically to devices on a network?",
        [
          Answer("A-DNC", false),
          Answer("B-FTP", false),
          Answer("C-DHCP", true),
          Answer("D-HTTP", false),

        ]),
  );

  return list;
}