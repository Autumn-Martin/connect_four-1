
A board is made up of a collection of Spaces. Each space has an X and a Y coordinate.

```
00 01 02 03 04 05 06
10 11 12 13 14 15 16
20 21 22 23 24 25 26
30 31 32 33 34 35 36
40 41 42 43 44 45 46
50 51 52 53 54 55 56
```

Each row contains spaces with the same Y coordinate.
Each column contains spaces with the same X coordinate.
Each NE diagonal contains spaces where the sum of the X and Y coordinate is the same.

```
5 + 0 = 5
4 + 1 = 5
3 + 2 = 5
# etc.
```

Each SE diagnoal contains spaces where the difference between the X and Y coordinates is the same.

```
3 - 0 = 3
4 - 1 = 3
5 - 2 = 3
```

Of note, this is not the absolute value of the difference. The diagonal below (with a difference of negative 3) is separate from the one above (with a difference of positive 3)

```
0 - 3 = -3
1 - 4 = -3
2 - 5 = -3
3 - 6 = -3
```
