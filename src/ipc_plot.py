import csv
import matplotlib.pyplot as plt
import sys
import argparse

ap = argparse.ArgumentParser(usage='Plot already normalized CSV data')
ap.add_argument('--output', '-o', help='Output to file. Otherwise show.',
                nargs='?')
ap.add_argument('--name', '-n', help='Name of run giving the threads and div',
                nargs='?')

ap.add_argument('inf', nargs='?', default=sys.stdin, type=argparse.FileType('r'),
                help='input CSV file')
args = ap.parse_args()

inf = args.inf

name = args.name

rc = csv.reader(inf)


num = 0
timestamps = []
columns = dict()
for r in rc:
    num += 1
    if num == 1:
        for j in r[1:]:
            columns[j] = []
        continue
    timestamps.append(r[0])
    c = 1
    for j in columns:
        try:
            columns[j].append(float(r[c]))
        except ValueError:
            columns[j].append(float('nan'))
        c += 1

ipc = []


insn = list(columns.values())[-5]
cyc = list(columns.values())[-2]
for x, y in zip(insn, cyc):
    #print x, y
    ipc_val = float(x)/float(y)
    ipc.append(ipc_val)

plt.xlabel('Time',  fontsize=18)
plt.ylabel('IPC',  fontsize=18)
plt.title(name,  fontsize=20)
plt.grid(True)
plt.plot(timestamps, ipc, 'c-', label="IPC")
leg = plt.legend()
leg.get_frame().set_alpha(0.5)
if args.output:
    plt.savefig(args.output)
else:
    plt.show()