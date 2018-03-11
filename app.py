import os

div = os.environ['DIV']
threads = os.environ['THREAD']

print div
print type(div)

print threads
print type(threads)



os.system("go build sparse.go")

r = int(threads)*int(div)

print r
print type(r)

if int(threads) == 1:
	os.system("./sparse "+ str(r))	

elif int(threads) == 2:
	str = "parallel ::: ./sparse " + str(r)+" ./sparse "+str(r)
	os.system("parallel ::: ./sparse " + str(r)+" ./sparse "+str(r))
	print str

elif int(threads) == 4:
	str = "parallel ::: ./sparse " + str(r)+" ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse "+str(r)
	os.system("parallel ::: ./sparse " + str(r)+" ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse "+str(r))
	print str

elif int(threads) == 8:
	str = "parallel ::: ./sparse " + str(r)+" ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse " + str(r)+" ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse "+str(r)								
	os.system("parallel ::: ./sparse " + str(r)+" ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse " + str(r)+" ./sparse "+str(r) + " ./sparse "+str(r) + " ./sparse "+str(r))
	print str
else:
	print "error: incorrect input"
	print "threads: " + str(threads)
	print "div: "+ str(div)
