import 'dart:io';

void main() {
  List<String> board = List.filled(9, ' ');
  String currentPlayer = 'X';

  
  while (true) {
    printBoard(board);
    print("Player $currentPlayer, enter your move (1-9): ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty || int.tryParse(input) == null) {
      print(" إدخال غير صالح. الرجاء إدخال رقم من 1 إلى 9.");
      continue;
    }

    int move = int.parse(input) - 1;

    if (move < 0 || move > 8 || board[move] != ' ') {
      print(" . الخلية مشغولة .");
      continue;
    }

    board[move] = currentPlayer;

    if (checkWinner(board, currentPlayer)) {
      printBoard(board);
      print(" اللاعب $currentPlayer فاز!");
      break;
    }

    if (!board.contains(' ')) {
      printBoard(board);
      print(" تعادل!");
      break;
    }

    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }

  print(" انتهت اللعبة..");
}

void printBoard(List<String> board) {
  print(
    "\n"
    " ${board[0]} | ${board[1]} | ${board[2]}\n"
    "---+---+---\n"
    " ${board[3]} | ${board[4]} | ${board[5]}\n"
    "---+---+---\n"
    " ${board[6]} | ${board[7]} | ${board[8]}\n",
  );
}

bool checkWinner(List<String> board, String player) {
  List<List<int>> winPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  for (var pattern in winPatterns) {
    if (board[pattern[0]] == player &&
        board[pattern[1]] == player &&
        board[pattern[2]] == player) {
      return true;
    }
  }
  return false;
}
