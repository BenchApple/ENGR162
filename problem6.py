from matplotlib import pyplot as plt
import numpy

x = []
for i in range(0, 96):
    x.append(0)

for i in range(0, 36):
    x.append(1)

for i in range(0, 20):
    x.append(2)

for i in range(0, 6):
    x.append(3)

x.append(4)
x.append(4)

bins = 5
(n, b, p) = plt.hist(x, bins, facecolor='blue', alpha=.5)

plt.xlabel('Number of Flaws')
plt.ylabel('Frequency')
plt.title("Histogram of Number of flaws per 3D printed Part")

stddev = numpy.std(x)
print(stddev)
print(stddev ** 2)

plt.show()