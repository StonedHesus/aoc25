import std.stdio;
import std.conv;
import std.regex : matchFirst, ctRegex;

void main() {
        File fin = File("in", "r");
        scope(exit) {
                fin.close();
        }

        auto dial = 50;
        uint result;
        foreach (line; fin.byLine) {
                auto m = matchFirst(line, ctRegex!`([A-Z]+)([0-9]+)`);
                if(m[1] == "L") {
                        dial = (((dial - to!int(m[2])) % 100) + 100)%100;
                }
                if(m[1] == "R") {
                        dial = (((dial + to!int(m[2])) % 100) + 100)%100;
                }

                if(dial == 0) {
                        result +=1;
                }
        }

        File fout = File("out", "w");
        fout.write(result);
        fout.close();
}
