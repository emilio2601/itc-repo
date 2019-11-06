#include <iostream>
#include <fstream>
#include <vector>
#include <bitset>
#include <map>

using namespace std;

vector<string> codes = {"D","PP","CF","A7","CC","B","OY","HC","A6","EC","N","PK","JA","XA","9V","HS"};
vector<string> planes;

int main() {
    for (int i = 0; i < 100000000; i++) {
        cout << codes[rand() % 16] + to_string(rand() % 200 + 101) << '\n';
    }
    return 0;
}