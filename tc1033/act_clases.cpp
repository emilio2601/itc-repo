#include <iostream>
#include <cmath>

class Point {
    public:

    double x, y;

    Point() {
        x = 0;
        y = 0;
    }

    Point(double px, double py) {
        x = px;
        y = py;
    }

    double distance(Point other) {
        double dx = other.x - x;
        double dy = other.y - y;
        return std::sqrt((dx * dx) + (dy * dy));
    }
};

int main() {
    Point x = Point();
    Point y = Point(3, 4);
    std::cout << "La distancia entre puntos es de: " << x.distance(y) << std::endl;
}