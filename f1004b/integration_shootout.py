from tabulate import tabulate

G        = 0
VELOCITY = 22
dt       = 0.01
iters    = 500

pos_n = 0
vel_n = VELOCITY

pos_old = 0 - (VELOCITY * dt)
pos_new = 0

results = []

for i in range(iters):
    t = dt * i

    formula = (0.5 * G * (t*t)) + (VELOCITY * t)

    vel_n = vel_n + (G * dt)
    pos_n = pos_n + (vel_n * dt)

    vx = (pos_new - pos_old)
    pos_old = pos_new
    pos_new += vx

    delta = abs(pos_new - formula)

    results.append((t, formula, pos_n, pos_new, delta))
    

print(tabulate(results, ["t", "Formula", "Euler", "Verlet", "Deltas"]))
