import RPi.GPIO as GPIO
import time
import datetime
import subprocess
from subprocess import check_output as qx

buttonLastPress = datetime.datetime.now()

class Physical:
	statusLED = 0
	lastStatusUpdate = datetime.datetime.now()
	def __init__(self ):
		self.statusLED = 0
		self.lastStatusUpdate = datetime.datetime.now()
		self.setupGPIO()

	def update(self):
		self.updateStatusLED()

	def setupGPIO(self):
		self.cleanGPIO()
		GPIO.setmode(GPIO.BOARD)
		GPIO.setup(8, GPIO.IN)
		GPIO.setup(10, GPIO.OUT, 0)
		GPIO.setup(12,GPIO.IN)
		GPIO.setup(16,GPIO.OUT, 0)
	def cleanGPIO(self):
		GPIO.cleanup()

	def updateStatusLED(self):
		status = qx(["mpc"])
		now = datetime.datetime.now()
		delta = now - self.lastStatusUpdate
		if delta.total_seconds() > 0.5:
			self.lastStatusUpdate = now
			#print status
			if "[playing]" in status:
				GPIO.output(10,1)
				GPIO.output(16,1)

			else:
				GPIO.output(10,0)
				GPIO.output(16,0)



def toogleRadio():
	qx(["mpc", "toggle"])

def stopRadio():
	qx(["mpc", "stop"])

try:
	print "Starting Pifi..."
	phy = Physical()
	stopRadio()

	while 1:
		phy.update()
		if not GPIO.input(8):
			now = datetime.datetime.now()
			delta = now - buttonLastPress
			if delta.total_seconds() > 0.4:
				buttonLastPress = now
				print "Play/Pause button pressed"
				toogleRadio()
		if not GPIO.input(12):
			now = datetime.datetime.now()
			delta = now - buttonLastPress
			if delta.total_seconds() > 0.4:
				buttonLastPress = now
				print "Next button pressed"
	phy.cleanGPIO();
	qx(["mpc", "stop"])
except Exception, e:
	GPIO.cleanup()
	qx(["mpc", "stop"])
	print "Error",e
	print "\nSooo error. No playback. Channels. Much Clean. Very Terminating. WOW."
except:
	GPIO.cleanup()
	qx(["mpc", "stop"])
	print "\nSooo unexpected. No playback. Channels. Much Clean. Very Terminating. WOW."


