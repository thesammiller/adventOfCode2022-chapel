use IO;

enum result {lose = 0, draw = 3, win = 6};
enum shape {rock = 1, paper, scissors };
enum cols {A = shape.rock:int, B, C } 
enum cols2 {X = result.lose:int, Y = result.draw:int, Z = result.win:int };

proc winner(s1, s2) {
    return s1:int == shape.rock:int && s2:int == shape.scissors:int ||
           s1:int == shape.paper:int && s2:int == shape.rock:int ||
           s1:int == shape.scissors:int && s2:int == shape.paper:int;
}

proc win(s1) {
    if (s1:int == shape.rock:int) {
        return shape.paper:int;
    }
    else if (s1:int == shape.paper:int) {
        return shape.scissors:int;
    }
    else if (s1:int == shape.scissors:int) {
        return shape.rock:int;
    }
    return 0;
}

proc lose(s1) {
    if (s1:int == shape.rock:int) {
        return shape.scissors:int;
    }
    else if (s1:int == shape.paper:int) {
        return shape.rock:int;
    }
    else if (s1:int == shape.scissors:int) {
        return shape.paper:int;
    }
    return 0;   
}

var total: int = 0;

proc getData() {
    var more: bool = true;
    var newLine: string;

    while(more) {
        more = readLine(newLine);
        if (newLine.size > 1) {   
            var val1 = newLine[0] : cols;
            var val2 = newLine[2] : cols2;
            var score: int = val2:int;

            if (val2:int == result.win:int) {
                score = score + win(val1);
                // writeln("win");
            }
            else if (val2:int == result.lose:int) {
                score = score + lose(val1);
                // writeln("you lose");
            }
            else if (val2:int == result.draw:int) {
                score = score + val1:int;
                // writeln("you draw");
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
