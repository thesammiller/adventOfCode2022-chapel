use IO;

var more = true;

proc checkForCommon(left, right) {
    var D : domain(int);
    var A : [D] string;
    
    for i in 0..left.size-1 {
        for j in 0..right.size-1 {
            if (left[i] == right[j]) {
                writeln("Shared item: ", left[i]);
                A.add(left[i]);
            }
        }
    }
    writeln(A);

}

proc getData() {
    var newLine: string;
    var left, right: string;
    while(more) {
        more = readln(newLine);
        writeln(newLine);
        if (newLine.size > 1) {
            left = newLine(0..newLine.size/2-1);
            write("left: ", left);
            right = newLine(newLine.size/2..newLine.size-1);
            writeln(" right: ", right);
            checkForCommon(left, right);
        }
    }
}

getData();