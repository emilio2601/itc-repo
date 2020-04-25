#include <iostream>
#include <fstream>
#include <vector>
#include <map>

using namespace std;

const map<string, string> PREFIXES = {{"D", "Alemania"}, {"PP", "Brasil"}, {"CF", "Canadá"}, {"A7", "Qatar"}, {"B", "China"}, {"CC", "Chile"}, {"OY", "Dinamarca"}, {"HC", "Ecuador"}, {"A6", "Emiratos Arabes"}, {"EC", "España"}, {"N", "Estados Unidos"}, {"PK", "Indonesia"}, {"JA", "Japón"}, {"XA", "México"}, {"9V", "Singapur"}, {"HS", "Tailandia"}};

map<string, int> get_country_frequencies(vector<string> aircraft_list) {
    map<string, int> freqs = {};

    for (auto aircraft: aircraft_list) {
        for (const auto& [prefix, country]: PREFIXES) {
            if (aircraft.rfind(prefix, 0) == 0) { // if starts with prefix
                freqs.emplace(country, 0); // Python-like defaultdict behavior
                freqs[country] += 1;
            }
        }
    }

    return freqs;
}

int main() {
    vector<string> aircraft_list;
    std::ifstream infile("aircraft.txt");

    string aircraft;
    while (infile >> aircraft) {
        aircraft_list.push_back(aircraft);
    }

    map<string, int> freqs = get_country_frequencies(aircraft_list);

    for (const auto& [country, count]: freqs) {
        double relative_freq = (double) count / aircraft_list.size();
        cout << country << " tiene " << count << ( (count == 1) ? " avión" : " aviones" );
        if (relative_freq > 0.2) {
            cout << " (mucho contacto)";
        }
        cout << endl;
    }
}