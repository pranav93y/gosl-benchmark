import os

div = os.environ['DIV']
threads = os.environ['THREAD']


os.system("go build sparse.go")

if threads == 1:
	os.system("./sparse "+ str(div))	

elif threads == 2:
	str = "parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads))
	os.system("parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)))
	print str

elif threads == 4:
	str = "parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads))
	os.system("parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)))
	print str

elif threads == 8:
	str = "parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads))								
	os.system("parallel ::: ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse " + str(int(div)*int(threads))+" ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)) + " ./sparse "+str(int(div)*int(threads)))
	print str
else:
	print "error: incorrect input"
