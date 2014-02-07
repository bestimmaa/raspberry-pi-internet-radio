#!/usr/bin/python
# -*- coding: utf-8 -*-
 
import os
import random
from subprocess import check_output as qx

img_folder = "/home/pi/pics"

def give_random_pic(self):
	return img_folder+"/flower.png"

def get_line_1():
	status = qx(["mpc"])
	status = status.split('\n')
	if len(status) >= 1:
		return status[0]
	else:
		return ""

def get_line_2():
	status = qx(["mpc"])
	status = status.split('\n')
	if len(status) >= 2:
		return status[1]
	else:
		return ""

def get_line_3():
	status = qx(["mpc"])
	status = status.split('\n')
	if len(status) >= 3:
		return status[2]
	else:
		return ""
		
def main(textarg):
	options = {
		'1' : get_line_1,
		'2' : get_line_2,
		'3' : get_line_3,
	}
	return options[textarg]()
		
if __name__ == "__main__":
	print "No use for me...."