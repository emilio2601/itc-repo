from functools import lru_cache
import math

@lru_cache(maxsize=None)
def coin_count(money):
  coins = [25, 10, 1]
  
  if money == 0:
    return 0
  
  if money < 0:
    return None

  best_res = math.inf
  
  for coin in coins:
    res = coin_count(money - coin)
    if res is not None:
      best_res = min(best_res, res + 1)
  
  return best_res


print(coin_count(30))