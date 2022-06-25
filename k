  async function ChoessNextRoom(Next_Room) {
    if (roomNum - 1 == Next_Room || roomNum + 1 == Next_Room || roomNum - 6 == Next_Room || roomNum + 6 == Next_Room) {
      playSound('pres');
      if (Next_Room != 0) {
        if (Next_Room == roomNum + 1) {
          if ((roomNum - 5) % 6 != 0) {
            validateRoomVote("Room2");
          }
        } else if (Next_Room == roomNum - 1) {
          if (roomNum % 6 != 0) {
            validateRoomVote("Room4");
          }
        } else if (Next_Room == roomNum - 6) {
          if (roomNum > 5) {
            validateRoomVote("Room1");}
        } else if (Next_Room == roomNum + 6) { 
          if (roomNum < 30) {
            validateRoomVote("Room3");}
        }
        if (
          Player_room1.length +
          Player_room2.length +
          Player_room3.length +
          Player_room4.length ==
          ActivePlayer.length
        ) {
          getQuestion();
          ModalC('Question')
          MaxVotesOfNextRoom();
          
          await updateDoc(doc(db, "Game", IDToBeSent), {
            QuestionModal: true,
          });
        }
      }
    }
  }

  //---------------------------------------------------------------------Choess Answer
  async function ChoessAnswer(FinalAnswer) {
    playSound('pres');
    if (FinalAnswer == 0) {
      validateAnswerVote("Choice1");
    } else if (FinalAnswer == 1) {
      validateAnswerVote("Choice2");
    } else if (FinalAnswer == 2) {
      validateAnswerVote("Choice3");
    } else if (FinalAnswer == 3) {
      validateAnswerVote("Choice4");
    }

    if (
      Player_Answer1.length +
      Player_Answer2.length +
      Player_Answer3.length +
      Player_Answer4.length ==
      ActivePlayer.length
    ) {
      MaxVotesOfFinalAnswer(); 

      const docref = doc(db, "Game", IDToBeSent);
      await getDoc(docref).then((doc) => {
        finalAnswer = doc.get("FinalAnswer");
      });

      if (finalAnswer == currentq[0]) {

        await updateDoc(doc(db, "Game", IDToBeSent), {
          Validate:'true'
        })

        if (Point != null) {
      await updateDoc(doc(db, "Game", IDToBeSent), {
        QuestionModal: false,
        Points: Point + currentq[2],
      }); 
  
        }
      
        showPessimistOrFoggyWarnaing(positionOfNextRoom);
        if (fogIndexs.includes(roomNum) && ActivePlayer.length > 1) {
          await updateDoc(doc(db, "Game", IDToBeSent), {
            ExplorerModal: true,
          });
        ModalC("Explorer");
        } else {
          Move("Players");
        }
      } else if (finalAnswer != currentq[0]) {
        playSound('wrong');
      
    await updateDoc(doc(db, "Game", IDToBeSent), {
      QuestionModal: false,
    });
        if (numberOfTape == 1) {
          endGame('LossTape');
        } else {
          if (numberOfTape != null) {
            await updateDoc(doc(db, "Game", IDToBeSent), {
              NumberOftape: numberOfTape - 1,
            });
          }
        }
      }
      await updateDoc(doc(db, "Game", IDToBeSent), {
        Validate:'',
      });

    }
  }
  //---------------------------------------------------------------------Choess Explorer
  async function ChoessExplorer(FinalExplorer) {

    if (FinalExplorer == Players[0].Email) {
      validateExplorerVote("Player1");
    } else if (FinalExplorer == Players[1].Email) {
      validateExplorerVote("Player2");
    } else if (FinalExplorer == Players[2].Email) {
      validateExplorerVote("Player3");
    }
      ModalC('Explorer')
    if (
      Player_Explorer1.length +
      Player_Explorer2.length +
      Player_Explorer3.length ===
      ActivePlayer.length
    ) {
      await updateDoc(doc(db, "Game", IDToBeSent), {
        ExplorerModal: false,
      });

      MaxVotesOfFinalExplorer();

      const docref = doc(db, "Game", IDToBeSent);
      await getDoc(docref).then((doc) => {
        finalExplorer = doc.get("FinalExplorer");
      });

      Move('Explorer');


    }
  }
