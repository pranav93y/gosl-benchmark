import os

div = os.environ['DIV']
threads = os.environ['THREAD']


os.system("go build sparse.go")

if int(threads) == 1:
	os.system("./sparse "+ str(div))	

elif int(threads) == 2:
	str = "parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads))
	os.system("parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)))
	print str

elif int(threads) == 4:
	str = "parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads))
	os.system("parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)))
	print str

elif int(threads) == 8:
	str = "parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads))								
	os.system("parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)))
	print str
else:
	print "error: incorrect input"
	print "threads: " + threads
	print "div: "+ div
