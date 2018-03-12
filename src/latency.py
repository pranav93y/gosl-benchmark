import os
import time
import Tkinter
import matplotlib.pyplot as plt


test = "h"*10

os.system('echo '+test+' | nano')

# x = os.path.getsize('./nano.save')
# print "x: "+str(x)

time_taken = []
bytes_written = []

for i in range(100, 1000):
	test = 'b'*i
	start = time.time()
	os.system('echo '+test+' | nano')
	end = time.time()

	time_taken.append(end-start)
	bytes_written.append(i)
	x = os.path.getsize('./nano.save')
	#print x, i
	os.system('rm nano.save')

# print time_taken
# print "---------------------------------"
# print bytes_written

plt.xlabel('Bytes Written',  fontsize=18)
plt.ylabel('Time',  fontsize=18)
plt.title('Time vs Bytes Written',  fontsize=20)
plt.grid(True)
plt.plot(bytes_written, time_taken, 'c-', label="Bytes Written vs Time Taken to Write on nano")
leg = plt.legend()
leg.get_frame().set_alpha(0.5)
#plt.savefig("./latency.png")
plt,show()
