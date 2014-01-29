#!/usr/bin/python
# -*- coding: utf-8 -*-
 
import os
import random

class Slideshow:
	img_folder=""
	
	def __init__(self):
		self.img_folder="/home/pi/pics"
		
	def give_random_pic(self):
		return self.img_folder+"/flower.png"
		
def main(textarg):
	sw = Slideshow()
	return sw.give_random_pic()
		
if __name__ == "__main__":
	sw = Slideshow()
	print sw.give_random_pic()