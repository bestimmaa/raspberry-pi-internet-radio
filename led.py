import RPi.GPIO as GPIO
import time
import datetime
import subprocess

buttonLastPress = datetime.datetime.now()

def toogleRadio():
	subprocess.call(["mpc", "toggle"])


try:

	GPIO.setmode(GPIO.BOARD)
	GPIO.setup(10, GPIO.OUT, 0)
	GPIO.setup(8, GPIO.IN)
	subprocess.call(["mpc", "stop"])

	while 1:
		if GPIO.input(8):
			now = datetime.datetime.now()
			delta = now - buttonLastPress
			if delta.total_seconds() > 0.4:
				buttonLastPress = datetime.datetime.now()
				print "Button pressed - " + str(datetime.datetime.now().time())
				toogleRadio()
			GPIO.output(10,1)
		else:
			GPIO.output(10,0)

	GPIO.cleanup()
except:
	GPIO.cleanup()
	print "\n Cleaned all pins - Terminating..."
