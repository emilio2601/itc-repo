substances = {'Air': (0.1358,0.0000364), 
        'Ammonia': (0.4225,  0.0000371),
            'CO2': (0.364,   0.00004267),
            'CO': (0.1505,   0.00003985),
            'He': (0.003457, 0.0000237),
            'H2': (0.02476,  0.00002661),
            'CH4': (0.2283,  0.00004278),
            'N2': (0.1408,   0.00003913),
            'O2': (0.1378,   0.00003183)
            }

# A in J*m3/mol2, B in m3/mol

MOLES = 50000 # mol
TEMP  = 10000 # Kelvin
VOL   = 1 # m3
R     = 8.3144621 # J/(mol*K)

subs = []

def real_pressure(n, T, V, a, b):
    return (n*R*T)/(V - (n*b)) - (a * (n**2/V**2))

def ideal_pressure(n, T, V):
    return (n*R*T)/V

for substance, van_der_waals in substances.items():
    real  = real_pressure(MOLES, TEMP, VOL, *van_der_waals)
    ideal = ideal_pressure(MOLES, TEMP, VOL)
    delta = abs(real-ideal)
    subs.append((substance, delta))

subs.sort(key=lambda x: x[1])

for substance, delta in subs:
    print(f"Delta for {substance}: {delta} Pa")