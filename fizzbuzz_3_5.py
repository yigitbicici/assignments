# -*- coding: utf-8 -*-
"""FizzBuzz_3_5.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1YdAk1lQz0Pv3SChQwF78VIdrIIh6H4BT
"""

for i in range(1,101):
  if i%3 == 0 and i%5 == 0:
    print('FizzBuzz')
  elif i%5 == 0:
    print('Buzz')
  elif i%3 == 0:
    print('Fizz')
  else:
    print(i)

