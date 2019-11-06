#include <iostream>
#include <fstream>
#include <vector>
#include <bitset>
#include <map>

using namespace std;

const map<string, string> PREFIXES = {{"D", "Alemania"}, {"PP", "Brasil"}, {"CF", "Canadá"}, {"A7", "Qatar"}, {"B", "China"}, {"CC", "Chile"}, {"OY", "Dinamarca"}, {"HC", "Ecuador"}, {"A6", "Emiratos Arabes"}, {"EC", "España"}, {"N", "Estados Unidos"}, {"PK", "Indonesia"}, {"JA", "Japón"}, {"XA", "México"}, {"9V", "Singapur"}, {"HS", "Tailandia"}};

bitset<256> form_prefix_map(map<string, string> prefixes) {
    bitset<256> prefix_map;
    for(const auto& [prefix, country]: PREFIXES) {
        if(prefix.size() == 1) {
            prefix_map[(int) prefix[0]] = 1;
        }
    }
    return prefix_map;
}

int main() {
    std::ifstream infile("aircraft.txt");

    uint32_t *freqs = (uint32_t*) calloc(0x7FFF, sizeof(uint32_t));
    auto prefix_map = form_prefix_map(PREFIXES);

    for(const auto& [prefix, country]: PREFIXES) {
        if(prefix.size() == 1){
            freqs[(int) prefix[0] |  ((int) ' ') << 8] = 0;
        } else {
            freqs[(int) prefix[0] | ((int) prefix[1] << 8)] = 0;
        }
        
    }

    char* line = new char[8];
    int line_count = 0;
    while(infile.getline(line, 8)){
        line_count++;
        if(prefix_map[line[0]]) { //prefix is one letter
            freqs[(uint32_t) line[0]] += 1;
        } else {
            freqs[(uint32_t) line[0] | ((uint32_t) line[1] << 8)] += 1;
        }
    }

    for (uint32_t i = 0; i < 0x7FFF; i++) {
        uint32_t count = freqs[i];
        uint32_t prefix = i;
        if(count > 0) {
            unsigned char buf[2];
            buf[0] = prefix & 0xff;
            buf[1] = (prefix >> 8) & 0xff;
            string prefix_str;
            if(buf[1]) {
                 prefix_str.assign((char*) buf, 2);
            } else {
                 prefix_str.assign((char*) buf, 1);
            }
            double relative_freq = (double) count / line_count;
            cout << PREFIXES.find(prefix_str)->second << " tiene " << count << ( (count == 1) ? " avión" : " aviones" );
            if(relative_freq > 0.2){
                cout << " (mucho contacto)";
            }
            cout << endl;
        }
    }
}