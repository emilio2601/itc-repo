#include <iostream>
#include <vector>

using namespace std; 

int32_t coin_count(int32_t money) {
    vector<int32_t> coins{25, 10, 1};

    if(money == 0) {
        return 0;
    } else if(money < 0) {
        return -1;
    }

    int32_t best_res = INT32_MAX;

    for(auto coin: coins) {
        int32_t res = coin_count(money - coin);
        if(res != -1) {
            best_res = min(best_res, res + 1);
        }
    }

    return best_res;
}

int main() {
    cout << coin_count(125) << endl;
}