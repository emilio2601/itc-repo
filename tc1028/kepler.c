#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>

double A_c = 238810273700;
double B_c = 150331209636;
double W_c = 0.008391006;
double H_c = 185555582200;
double K_c = 0;

double A_t = 149597887500;
double B_t = 149576999800;
double W_t = 0.017202424;
double H_t = 2499813612;
double K_t = 0;

double threshold = 6371000 * 3;

double get_body_x(double T, double A, double W, double H){
    return A * cos(W * T) + H;
}

double get_body_y(double T, double B, double W, double K){
    return B * sin(W * T) + K;
}

double get_distance(double x1, double y1, double x2, double y2){
    double dx = (x1 - x2);
    double dy = (y1 - y2);
    double dist = sqrt(dx*dx + dy*dy);  
}

int main(void){
    double add = 1.0f / (365.0f * 3600.0f * 24.0f); 
    #pragma omp parallel
    {
    int iters_year = 365 * 3600 * 24;
    int iters = 0;
    while(true){
        double T = (iters * omp_get_num_threads()) + omp_get_thread_num();
        if(T > 100){
            printf("Yeah we're done");
            exit(0);
        }
        printf("We're on year %f from thread %d\n", T, omp_get_thread_num());
        for (size_t i = 0; i < iters_year; i++) {
            double comet_x = get_body_x(T, A_c, W_c, H_c);
            double comet_y = get_body_y(T, B_c, W_c, K_c);
            double earth_x = get_body_x(T, -A_t, W_t, H_t);
            double earth_y = get_body_y(T, B_t, -W_t, K_t);
            double delta   = get_distance(comet_x, comet_y, earth_x, earth_y);

            if(delta < threshold) {
                printf("We have a crash at T = %f\n", T);
                exit(1);
            }

            T += add;
        }
        iters += 1;
    }
}
}