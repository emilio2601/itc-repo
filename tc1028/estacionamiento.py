from random import randint
from sys import exit

def lot_gen():
  with open ("lot.txt","w") as f:
    for i in range(10):
        for j in range(15):
            if j<14:
              f.write("0," if randint(0,1) == 0 else "1,")
            else:
              f.write("0" if randint(0,1) == 0 else "1")
        f.write("\n")
  return f

def idx_to_parking_notation(i, j):
  return f"{chr(i+97)}{j+1}".center(3)

def print_parking():
  parking = []
  with open('lot.txt', 'r') as f:
    for line in f.readlines():
      parking.append(line.rstrip('\n').split(','))
  print('-' * 105)
  for x, line in enumerate(parking):
    array_parking_lot = ' || '.join([idx_to_parking_notation(x, y) if place == '0' else 'X'.center(3) for y, place in enumerate(line)])
    print(f'| {array_parking_lot} |')
  print('-' * 105)

def main():
  choice = None
  while choice != "":
    choice = int(input())
    menu = {1: lot_gen, 2: print_parking, 3: exit}
    menu[choice]()
    
main()