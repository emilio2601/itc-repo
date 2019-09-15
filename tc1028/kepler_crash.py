from decimal import Decimal
import math

A_c = Decimal(238810273700)
B_c = Decimal(150331209636)
W_c = Decimal(0.008391006)
H_c = Decimal(185555582200)
K_c = Decimal(0)

A_t = Decimal(149597887500)
B_t = Decimal(149576999800)
W_t = Decimal(0.017202424)
H_t = Decimal(2499813612)
K_t = Decimal(0)

def get_body_pos(T, A, B, W, H, K):
    x = A * Decimal(math.cos(W * T)) + H
    y = B * Decimal(math.sin(W * T)) + K
    return (x, y)

def get_distance(x1, y1, x2, y2):
    return math.sqrt((x2-x1)**2 + (y2-y1)**2)

T = Decimal(0)

while True:
    comet_x, comet_y = get_body_pos(T, A_c, B_c, W_c, H_c, K_c)
    earth_x, earth_y = get_body_pos(T, A_t, B_t, W_t, H_t, K_t)
    dist = get_distance(comet_x, comet_y, earth_x, earth_y)
    if dist < 63710000:
        print(f"We crash at T={T}")
        break
    T += Decimal(1) / Decimal(365*3600)
    print(T)
