#include <iostream>
#include <cmath>

using namespace std;
    
/*
    Okay so I forgot how inheritance is declared in C++, but here we'd have a Shape class
    and then Rectangle and Circle can inherit from it. I'm leaning towards it being something
    like an abstract base class, like a Java interface, and just have it empty, because I don't 
    think we can implement many useful methods here.

    Like there's no generic way of computing the area of a shape, and shapes have very different
    attributes. I guess one of the only common things between shapes is that they have an area 
    (or do we have open shapes too?), but we want that to be a method, not an attribute, so we 
    could just declare an empty getArea() method and have subclasses override it.
*/

class Rectangle {
    private:
    double length, width;

    public:

    Rectangle(double length, double width){
        this->length = length;
        this->width  = width;
    }

    double getLength(void) {
        return length;
    }

    double getWidth(void) {
        return width;
    }

    void setLength(double length) {
        this->length = length;
    }

    void setwidth(double width) {
        this->width = width;
    }

    double getArea(void) {
        return length * width;
    }
};

class Circle {
    private:
    double radius;

    public:

    Circle(double radius){
        this->radius = radius;
    }

    double getRadius(void) {
        return radius;
    }

    void setRadius(double radius) {
        this->radius = radius;
    }

    double getArea(void) {
        return M_PI * (radius * radius);
    }
};

int main(void) {
    Circle c(42);
    Rectangle r(10, 20);

    c.radius

    cout << "The area of a circle with radius " << c.getRadius() << " is: " << c.getArea() << endl;
    cout << "The area of a rectangle with length " << r.getLength() << " and width " << r.getWidth() << " is: " << r.getArea() << endl;

    return EXIT_SUCCESS;
}