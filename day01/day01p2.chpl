use IO;


var more = true;
var newLine: string;

var maxCalories: [1..3] int;
var currentCalories: int = 0;

proc getData() {
    while (more) {
        more = readLine(newLine);
        if (newLine == "\n") {
            for m in 1..3 {
                if (currentCalories > maxCalories[m]) {
                    for n in m+1..3 {
                        maxCalories[n] = maxCalories[n-1];
                    }
                    maxCalories[m] = currentCalories;
                    break;
                }
            }
            currentCalories = 0;
        }
        if (newLine.size > 1) {
            currentCalories = currentCalories + newLine: int; 
        }
    }
}


getData();
writeln(+ reduce maxCalories);