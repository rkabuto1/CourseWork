#include "P2.h"

int main(int argc, char* argv[]) {
    vector<string> args(argv + 1, argv + argc);

    if (args.size() < 2) {
        cout << "Error: To Run -> ./kabuto 'Letter Sequence' [space] Number Sequence" << endl;
        return 1;
    }
    auto outState = [](TState &x1, TState &x2, TState &x3, TState &x4) -> string {
        return string(1, x1.st) + x2.st + x3.st + x4.st;
    };

    cout << Flow(args[0], args[1], outState) << endl;
    return 0;
}
