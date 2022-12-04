use IO;


var more = true;
var newLine: string;

var maxCalories: int = 0;
var currentCalories: int = 0;

proc getData() {
    while (more) {
        more = readLine(newLine);
        if (newLine == "\n") {
            if (currentCalories > maxCalories) {
                maxCalories = currentCalories;
            }
            currentCalories = 0;
        }
        if (newLine.size > 1) {
            currentCalories = currentCalories + newLine: int; 
        }
    }
}

getData();
writeln(maxCalories);