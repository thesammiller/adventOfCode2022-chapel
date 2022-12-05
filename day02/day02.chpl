use IO;

enum result {lose = 0, draw = 3, win = 6};
enum shape {rock = 1, paper, scissors };
enum cols {A = shape.rock:int, B, C , 
           X = shape.rock:int, Y, Z };

proc winner(s1, s2) {
    return s1:int == shape.rock:int && s2:int == shape.scissors:int ||
           s1:int == shape.paper:int && s2:int == shape.rock:int ||
           s1:int == shape.scissors:int && s2:int == shape.paper:int;
}

var total: int = 0;

proc getData() {
    var more: bool = true;
    var newLine: string;

    while(more) {
        more = readLine(newLine);
        if (newLine.size > 1) {   
            var val1 = newLine[0] : cols;
            var val2 = newLine[2] : cols;
            var score: int = val2:int;

            if (val1:int == val2:int) {
                score = score + result.draw:int;
                // writeln("draw");
            }
            else if (winner(val1, val2)) {
                score = score + result.lose:int;
                // writeln("you win");
            }
            else if (winner(val2, val1)) {
                score = score + result.win:int;
                // writeln("you lose");
            }
            else {
                writeln("There's an issue if we reach this.");
            }
            // writeln(score);
            total = total + score;
        }
    }
}

getData();
writeln(total);
